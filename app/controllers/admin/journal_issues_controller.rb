class Admin::JournalIssuesController < Admin::BaseController
  before_action :set_admin_journal_issue, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_journal, only: [:new, :edit, :create, :update, :add_row_watchers, :show]
  before_action :set_number, only: [:new, :create]
  before_action :view_number, :set_selected, only: [:edit, :update, :show]

  # GET /admin/journal_issues
  # GET /admin/journal_issues.json
  def index
    @admin_journal = Admin::Journal.find(params[:journal_id])
    @pagging_status = true
  end

  def list_data_by_status
    @admin_journals_status = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(current_admin.id, params[:journal_issue_id])
    ids = []
    @admin_journals_status.each do |journal|
        ids << journal.id
    end
    @admin_journals_count = Admin::Journal.find(ids)

    @admin_journal_issues = Admin::JournalIssue.get_data_status(current_admin,params[:journal_issue_id]).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /admin/journal_issues/1
  # GET /admin/journal_issues/1.json
  def show
    session[:urlBack] = request.original_url
    @admin_journal_issue_comment = Admin::JournalIssueComment.new
  end

  def show_task_image    
      @admin_journal_issue_image = Admin::JournalIssueImage.find(params[:id])
  end

  # GET /admin/journal_issues/new
  def new
    @admin_journal_issue = Admin::JournalIssue.new
    @action = 'new'
  end

  # GET /admin/journal_issues/1/edit
  def edit
    @action = 'edit'
  end

  def edit_status
    
  end

  def add_row_watchers
      @index = Admin::Journal.generated_number(current_admin.id)
      respond_to do |format|
          format.js
      end
  end

  # POST /admin/journal_issues
  # POST /admin/journal_issues.json
  def create
    @action = 'create'
    @admin_journal_issue = Admin::JournalIssue.new(admin_journal_issue_params)

    respond_to do |format|
      if @admin_journal_issue.save
        #this method for sending message to admin about Journal issue who assign
        AdminMailer.delay(:queue => 'notification_create_journal_issue', :priority => 1).mail_journal_issue(@admin_journal_issue.id,@admin_journal_issue.asignee,"main")
        Admin::JournalIssue.save_attributes(@admin_journal_issue.id,params)
        format.html { redirect_to @admin_journal_issue, notice: 'Journal issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_journal_issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_journal_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/journal_issues/1
  # PATCH/PUT /admin/journal_issues/1.json
  def update
    respond_to do |format|
      if @admin_journal_issue.update(admin_journal_issue_params)
        Admin::JournalIssue.save_attributes(@admin_journal_issue.id,params)
        #this method for sending message to admin about Journal issue who assign
        AdminMailer.delay(:queue => 'notification_create_journal_issue', :priority => 1).mail_journal_issue(@admin_journal_issue.id,@admin_journal_issue.asignee,"main")
        unless params[:selected].blank?
              id_params = params[:selected]      
              id = convert_to_arr_for_query(id_params)
              Admin::JournalIssueImage.delete_all "id in #{id}"
         end
         unless params[:selected_files].blank?
              id_params = params[:selected_files]      
              id = convert_to_arr_for_query(id_params)
              Admin::JournalIssueFile.delete_all "id in #{id}"
         end
        format.html { redirect_to admin_journal_issue_path(id_journal: @admin_journal_issue.journal_id), notice: 'Journal issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_journal_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/journal_issues/1
  # DELETE /admin/journal_issues/1.json
  def destroy
    @admin_journal_issue.journal_issue_images.each do |image|
      loaded = Cloudinary::Uploader.destroy("journal_issue/images/#{image.id}", :public_id => "journal_issue/files/#{image.id}", :invalidate => true)
    end
    @admin_journal_issue.destroy
    respond_to do |format|
      format.html { redirect_to admin_journals_url }
      format.json { head :no_content }
    end
  end

  def destroy_add_rows
    Admin::JournalIssueAsignee.delete_all "journal_issue_id = #{params[:id]} AND admin_id = #{params[:admin_id]}"
    respond_to do |format|
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_journal_issue
      @admin_journal_issue = Admin::JournalIssue.find(params[:id])
    end

    def set_admin_journal
      unless params[:id].blank?
        @admin_journal = Admin::Journal.find(@admin_journal_issue.journal_id)
        @assign = Admin::JournalIssue.assign(@admin_journal_issue.journal_id).map { |x| ["#{x.name} #{x.last_name}",x.admin_id] }.unshift(['Select',nil])
      else
        @admin_journal = Admin::Journal.find(params[:id_journal].blank? ? params[:admin_journal_issue][:journal_id] : params[:id_journal])
        @assign = Admin::JournalIssue.assign(params[:id_journal].blank? ? params[:admin_journal_issue][:journal_id] : params[:id_journal]).map { |x| ["#{x.name} #{x.last_name}",x.admin_id] }.unshift(['Select',nil])
      end
      @status = Admin::StatusJournal.all.map { |x| [x.name,x.id] }.unshift(['Select Status',nil])
      @type = Admin::TypeJournal.all.map { |x| [x.name,x.id] }.unshift(['Select Type',nil])
      @priority = [ ['Select Priority', nil], ['Urgent',1], ['Hight',2], ['Normal',3] ]
      @progress = [ [10, 10], [20,20], [30,30], [40,40], [50,50], [60,60], [70,70], [80,80], [90,90], [100,100] ].unshift(['Progress',nil])
    end

    def set_selected
      @assigned = @admin_journal_issue.asignee
      @statused = @admin_journal_issue.status_id
      @priorited = @admin_journal_issue.priority
      @typed = @admin_journal_issue.type_id
      @progressed = @admin_journal_issue.progress
      @selected_assign = Admin::JournalIssueAsignee.where("journal_issue_id = #{@admin_journal_issue.id}")
    end

    def set_number
      @number = Admin::JournalIssue.generated_number_issue
    end

    def view_number
      @number = @admin_journal_issue.no
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_journal_issue_params
      params.require(:admin_journal_issue).permit(:journal_id, :status_id, :no, :type_id, :priority, :progress, :content, :asignee, :title, :start, :end)
    end
end
