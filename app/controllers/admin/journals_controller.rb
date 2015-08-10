class Admin::JournalsController < Admin::BaseController
  before_action :set_admin_journal, only: [:show, :edit, :update, :destroy, :destroy_add_rows]
  before_action :set_admin_journal_team, only: [:show, :edit, :update, :destroy_add_rows]
  before_action :set_select_options, only: [:new, :edit, :add_row_designers, :add_row_developers, :add_row_checks, :destroy_add_rows, :new_blank_project, :index, :filter]
  before_action :set_selected, only: [:edit, :update, :show]
  before_action :set_select, only: [:new, :create, :edit, :update, :new_blank_project]
  before_action :set_filter, only: [:index]
  before_filter :setup_page, except: [:new_blank_project, :edit,:show]
  # GET /admin/journals
  # GET /admin/journals.json
  def index
    @admin_journals = Admin::Journal.order("admin_journals.created_at DESC").paginate(:page => params[:page], :per_page => 20).is_allowed(session[:session_admin],nil)
    admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(session[:session_admin],nil)
    ids = []
    @admin_journals.each do |journal|
        ids << journal.id
    end
    ids_blank = convert_to_arr_for_query(ids)
    blank = Admin::JournalIssue.find_index_count(ids_blank == ")" ? "(0)" : ids_blank ,current_admin.id,'main')
    @admin_journals_status = blank
    ids_all = []
    admin_journals.each do |journal|
        ids_all << journal.id
    end
    ids_all_blank = convert_to_arr_for_query(ids_all)
    blank_all = Admin::JournalIssue.find_index_count(ids_all_blank == ")" ? "(0)" : ids_all_blank ,current_admin.id,'main')
    @admin_journals_status_all = blank_all
    session[:urlBack] = request.original_url
    @page_breadcump = " > Index"
  end

  # GET /admin/journals/1
  # GET /admin/journals/1.json
  def show
    @admin_journals = []
    @admin_journals << @admin_journal
    params = {"project" => @admin_journal.id}
    find_admin = Admin.find(session[:session_admin])
    ids = []
    @admin_journals.each do |journal|
        ids << journal.id
    end
    convert = convert_to_arr_for_query(ids)
    blanks = Admin::Journal.find_filter(find_admin,convert == ")" ? "(0)" : convert, params)
      @admin_journals_status_filter = blanks


     unless  estimated_time(@admin_journal.start,@admin_journal.end) == 'waiting'
        if estimated_time(@admin_journal.start,@admin_journal.end).to_i == 0
                @estimate = "<b>Now is Deadline</b>"
        elsif estimated_time(@admin_journal.start,@admin_journal.end).to_i < 0
                @estimate = "Out of Deadline"
        else
                time = estimated_time(@admin_journal.start,@admin_journal.end).to_i
                @estimate = "<b>#{time} Day left</b>"
        end
    else
            @estimate = "<b>Waiting</b>"
    end

    @projects = "selected"
    @page = @admin_journal.title
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

  def new_blank_project
    @admin_journal = Admin::Journal.new
    @action = 'new'
    @projects = "selected"
    @page = "Project"
    @page_breadcump = " > Creating New"
    respond_to do |format|
        format.html
        format.js
    end
  end

  # GET /admin/journals/1/edit
  def edit
    @action = 'edit'
    @projects = "selected"
    @page = "Project"
    @page_breadcump = " > Editing"
    respond_to do |format|
      format.html
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

def get_assign
    @admins = Admin::JournalIssue.assign(params[:project]).map { |x| ["#{x.name} #{x.last_name}",x.admin_id] }.unshift(['Select',nil])
    render layout: false
  end

  # POST /admin/journals
  # POST /admin/journals.json
  def create
      @admin_journal = Admin::Journal.new(admin_journal_params)
      design = params[:admin_journal][:jornal_team_designers_attributes]
      develop = params[:admin_journal][:journal_team_developers_attributes]
      check = params[:admin_journal][:journal_team_checks_attributes]
      respond_to do |format|
        if @admin_journal.save
          unless design["0"][:admin_id].blank?
            Admin::Journal.save_attributes(@admin_journal.id,design,'design')
          else
            design["0"][:admin_id] = current_admin.id
            Admin::Journal.save_attributes(@admin_journal.id,design,'design')
          end

          unless develop["0"][:admin_id].blank?
            Admin::Journal.save_attributes(@admin_journal.id,develop,'develop')
          else
            develop["0"][:admin_id] = current_admin.id
            Admin::Journal.save_attributes(@admin_journal.id,develop,'develop')
          end

          unless check["0"][:admin_id].blank?
              Admin::Journal.save_attributes(@admin_journal.id,check,'check')
          else
              check["0"][:admin_id] = current_admin.id
              Admin::Journal.save_attributes(@admin_journal.id,check,'check')
          end

          format.html { redirect_to admin_journals_path, notice: 'Project was successfully created.' }
          format.json { render action: 'show', status: :created, location: @admin_journal }
        else
          format.html { render action: 'new' }
          format.json { render json: @admin_journal.errors, status: :unprocessable_entity }
        end
      end
  end

  def filter
    @admin_journals = Admin::Journal.order("admin_journals.created_at DESC").paginate(:page => params[:page], :per_page => 20).is_allowed(session[:session_admin],nil)
    admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(session[:session_admin],nil)
    find_admin = Admin.find(session[:session_admin])
    ids = []
    @admin_journals.each do |journal|
        ids << journal.id
    end
    convert = convert_to_arr_for_query(ids)
    blanks = Admin::Journal.find_filter(find_admin,convert == ")" ? "(0)" : convert, params)
      @admin_journals_status_filter = blanks

    ids_all = []
    admin_journals.each do |journal|
        ids_all << journal.id
    end
    convert_all = convert_to_arr_for_query(ids_all)
    blank = Admin::Journal.find_filter(find_admin,convert_all == ")" ? "(0)" : convert, params)
    @admin_journals_status_filter_all = blank
    @assign = params[:assign]
    respond_to do |format|
      format.js
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

  def setup_page
    @journals = "selected active"
    @page = "Journals"
  end

   def estimated_time(start_time, end_time)
      if Date.today >= start_time
        time = end_time - Date.today
      else
        time = "waiting"
      end
      return time
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
        @admins = Admin::Profile.all.map { |x| ["#{x.name} #{x.last_name}",x.admin_id] }.unshift(['Select',nil])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_journal_params
      params.require(:admin_journal).permit(:title, :status_id,:project_manajer, :start, :end, :admin_id, :description)
    end

    def set_filter
      project = []
      admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(session[:session_admin],nil)
      admin_journals.each do |journal|
        project << [journal.title,journal.id]
      end
      @project = project.unshift(['Select',nil])
      @status = Admin::StatusJournal.all.map{|x|[x.name, x.id]}.unshift(['Select',nil])
      @priority = [ ['Select', nil], ['Urgent',1], ['Hight',2], ['Normal',3] ]
      @progress = [[0,0], [10, 10], [20,20], [30,30], [40,40], [50,50], [60,60], [70,70], [80,80], [90,90], [100,100] ].unshift(['Select',nil])
      @assign = [["None",nil]].unshift(['Select',nil])
    end
end
