class Admin::JournalsController < Admin::BaseController
  before_action :set_admin_journal, only: [:show, :edit, :update, :destroy, :destroy_add_rows]
  before_action :set_admin_journal_team, only: [:show, :edit, :update, :destroy_add_rows]
  before_action :set_select_options, only: [:new, :edit, :add_row_designers, :add_row_developers, :add_row_checks, :destroy_add_rows]
  before_action :set_selected, only: [:edit, :update, :show]
  before_action :set_select, only: [:new, :create, :edit, :update]
  # GET /admin/journals
  # GET /admin/journals.json
  def index
    @admin_journals = Admin::Journal.order("admin_journals.created_at DESC").paginate(:page => params[:page], :per_page => 6).is_allowed(current_admin.id,nil)
    ids = []
    @admin_journals.each do |journal|
        ids << journal.id
    end
    @admin_journals_status = Admin::Journal.find(ids)
    session[:urlBack] = request.original_url
  end

  # GET /admin/journals/1
  # GET /admin/journals/1.json
  def show
    session[:urlBack] = request.original_url
  end

  # GET /admin/journals/new
  def new
    @admin_journal = Admin::Journal.new
    @action = 'new'
    respond_to do |format|
        format.html
        format.js
    end
  end

  # GET /admin/journals/1/edit
  def edit
    @action = 'edit'
    respond_to do |format|
      format.js
    end
  end

  def project_search
      @admin_journals = Admin::Journal.search_by_params(current_admin.id,params)
      ids = []
       @admin_journals.each do |journal|
              ids << journal.id
       end
       id = convert_to_arr_for_query(ids)
       @admin_journals_status = Admin::JournalIssue.find_index_count(id == ")" ? "(0)" : id,current_admin.id,'search')

        respond_to do |format|
            format.html
        end
  end

  def add_row_designers
    @index = Admin::Journal.generated_number(current_admin.id)
    respond_to do |format|
        format.js
    end
  end

  def add_row_developers
    @index = Admin::Journal.generated_number(current_admin.id)
    respond_to do |format|
        format.js
    end
  end

  def add_row_checks
    @index = Admin::Journal.generated_number(current_admin.id)
    respond_to do |format|
        format.js
    end
  end

  # POST /admin/journals
  # POST /admin/journals.json
  def create
      @admin_journal = Admin::Journal.new(admin_journal_params)
      respond_to do |format|
        if @admin_journal.save
          Admin::Journal.save_attributes(@admin_journal.id,params[:admin_journal][:jornal_team_designers_attributes],'design')
          Admin::Journal.save_attributes(@admin_journal.id,params[:admin_journal][:journal_team_developers_attributes],'develop')
          Admin::Journal.save_attributes(@admin_journal.id,params[:admin_journal][:journal_team_checks_attributes],'check')
          format.html { redirect_to admin_journals_path, notice: 'Journal was successfully created.' }
          format.json { render action: 'show', status: :created, location: @admin_journal }
        else
          format.html { render action: 'new' }
          format.json { render json: @admin_journal.errors, status: :unprocessable_entity }
        end
      end
  end

  def selected_members
    member = params[:member].blank? ? 0 : params[:member]
    condition = "admin_id NOT IN (#{member},#{current_admin.id})"
    unless params[:member].blank?
        admin = Admin::Profile.where("{{condition}}".gsub('{{condition}}',condition.to_s))
        @admins_select = admin.map{|x|["#{x.name} #{x.last_name}", x.admin_id]}.unshift(['Select',nil])
    else
        @admins_select = [['Select', nil]]
    end
    render layout: false
  end

  def selected_checks
    member = params[:member].blank? ? 0 : params[:member]
    latest_member = params[:latest_member].blank? ? 0 : params[:latest_member]
    condition = "admin_id NOT IN (#{member}, #{latest_member}, #{current_admin.id})"
    unless params[:member].blank?
            admin = Admin::Profile.where("{{condition}}".gsub('{{condition}}',condition.to_s))
            @admins_select = admin.map { |x| ["#{x.name} #{x.last_name}", x.admin_id] }.unshift(['Select',nil])
    else
            @admins_select = [['Select',nil]]
    end
    render layout: false
  end

  # PATCH/PUT /admin/journals/1
  # PATCH/PUT /admin/journals/1.json
  def update
    respond_to do |format|
      if @admin_journal.update(admin_journal_params)
        Admin::Journal.save_attributes(@admin_journal.id,params[:admin_journal][:jornal_team_designers_attributes],'design')
        Admin::Journal.save_attributes(@admin_journal.id,params[:admin_journal][:journal_team_developers_attributes],'develop')
        Admin::Journal.save_attributes(@admin_journal.id,params[:admin_journal][:journal_team_checks_attributes],'check')
        format.html { redirect_to @admin_journal, notice: 'Journal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/journals/1
  # DELETE /admin/journals/1.json
  def destroy
    Admin::JornalTeamDesigner.delete_all "Journal_id = #{@admin_journal.id}"
    Admin::JournalTeamDeveloper.delete_all "Journal_id = #{@admin_journal.id}"
    Admin::JournalTeamCheck.delete_all "Journal_id = #{@admin_journal.id}"
    @admin_journal.journal_issues.each do |issue|
      issue.journal_issue_images.each do |image|
        loaded = Cloudinary::Uploader.destroy("journal_issue/images/#{image.id}", :public_id => "journal_issue/files/#{image.id}", :invalidate => true)
      end
    end
    @admin_journal.destroy
    respond_to do |format|
      format.html { redirect_to admin_journals_path }
      format.json { head :no_content }
    end
  end

  def destroy_add_rows
    if params[:type] == "designers"
      Admin::JornalTeamDesigner.delete_all "Journal_id = #{params[:id]} AND admin_id = #{params[:admin_id]}"
    elsif params[:type] == "developers"
      Admin::JournalTeamDeveloper.delete_all "Journal_id = #{params[:id]} AND admin_id = #{params[:admin_id]}"
    else
      Admin::JournalTeamCheck.delete_all "Journal_id = #{params[:id]} AND admin_id = #{params[:admin_id]}"
    end
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_journal
      unless params[:id] == "add_global_row"
          @admin_journal = Admin::Journal.find(params[:id])
      end
    end

    def set_admin_journal_team
      @selected_designer = Admin::JornalTeamDesigner.where("journal_id = ? ",params[:id])
      @selected_developer = Admin::JournalTeamDeveloper.where("journal_id = ? ",params[:id])
      @selected_check = Admin::JournalTeamCheck.where("journal_id = ? ",params[:id])
    end

    def set_select
      main = Admin::StatusJournal.where("id = 5")
      sub_main = Admin::StatusJournal.find(6)
      @status = main.map { |x| [x.name,x.id] }.unshift([sub_main.name,sub_main.id])
    end

    def set_selected
      @statused = @admin_journal.status_id
    end

    def set_select_options
        @admins = Admin::Profile.all.map{|x|["#{x.name} #{x.last_name}", x.admin_id]}.unshift(['Select',nil])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_journal_params
      params.require(:admin_journal).permit(:title, :status_id,:project_manajer, :start, :end, :admin_id)
    end
end
