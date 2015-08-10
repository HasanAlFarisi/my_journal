class Admin::JournalIssuesController < Admin::BaseController
  before_action :set_admin_journal_issue, only: [:show, :edit, :update, :destroy, :edit_status]
  before_action :set_admin_journal, only: [:new, :edit, :create, :update, :add_row_watchers, :show, :edit_status]
  before_action :set_number, only: [:new, :create]
  before_action :view_number, :set_selected, only: [:edit, :update, :show, :edit_status]
  before_action :update_notif, only: [:show]
  before_action :set_filter, only: [:list_data_by_status]
  before_action :set_select_project, only: [:select_project, :index]
  before_filter :setup_page
  # GET /admin/journal_issues
  # GET /admin/journal_issues.json
  def index
    respond_to do |format|
      unless params[:journal_id].blank?
        @admin_journal = Admin::Journal.find(params[:journal_id])
      else
        format.html {redirect_to admin_journals_path}
      end
      @pagging_status = true
    end
  end

  def list_data_by_status
    @admin_journals = Admin::Journal.is_allowed(session[:session_admin],nil)
    @admin_journal_issues = Admin::JournalIssue.get_data_status(current_admin,params[:journal_issue_id]).paginate(:page => params[:page], :per_page => 20)
    ids = []
    @admin_journal_issues.each do |journal|
        ids << journal.id
    end
    @admin_journals_status = Admin::JournalIssue.find(ids)

    admin_journals_status_all = Admin::JournalIssue.get_data_status(current_admin,params[:journal_issue_id])
    ids_all = []
    admin_journals_status_all.each do |journal|
        ids_all << journal.id
    end
    @admin_journals_status_all = Admin::JournalIssue.find(ids_all)

    @page_breadcump = " > #{Admin::StatusJournal.find(params[:journal_issue_id]).name}"
  end

  # GET /admin/journal_issues/1
  # GET /admin/journal_issues/1.json
  def show
    session[:urlBack] = request.original_url
    @admin_journal_issue_comment = Admin::JournalIssueComment.new
    @page_breadcump = " > ##{@admin_journal_issue.no}"
    unless  estimated_time(@admin_journal_issue.start,@admin_journal_issue.end) == 'waiting'
        if estimated_time(@admin_journal_issue.start,@admin_journal_issue.end).to_i == 0
                @estimate = "<b>Now is Deadline</b>"
        elsif estimated_time(@admin_journal_issue.start,@admin_journal_issue.end).to_i < 0
                @estimate = "Out of Deadline"
        else
                time = estimated_time(@admin_journal_issue.start,@admin_journal_issue.end).to_i
                @estimate = "<b>#{time} Day left</b>"
        end
    else
            @estimate = "<b>Waiting</b>"
    end
  end

  def show_task_image    
      @admin_journal_issue_image = Admin::JournalIssueImage.find(params[:id])
      respond_to do |format|
      format.html {render :partial => "admin/journal_issues/show_task_image"}
    end
  end

  # GET /admin/journal_issues/new
  def new
    @admin_journal_issue = Admin::JournalIssue.new
    @action = 'new'
    @page_breadcump = " > Create New"
  end

  # GET /admin/journal_issues/1/edit
  def edit_status
    @action = 'edit'
    respond_to do |format|
      format.html {render partial: "admin/journal_issues/edit_status_task"}
    end
  end

  def edit
    @action = 'edit'
    respond_to do |format|
      format.html
    end
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
    params[:admin_journal_issue][:from] = current_admin.id
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
    if @admin_journal_issue.asignee != params[:admin_journal_issue][:asignee]
           params[:admin_journal_issue][:notif_status] = false
    end
    if params[:admin_journal_issue][:status_id] == "5"
          params[:admin_journal_issue][:from] = params[:temp_from]
    end
    respond_to do |format|
      if @admin_journal_issue.update(admin_journal_issue_params)
        Admin::JournalIssue.save_attributes(@admin_journal_issue.id,params)
        #this method for sending message to admin about Journal issue who assign
        AdminMailer.delay(:queue => 'notification_create_journal_issue', :priority => 1).mail_journal_issue(@admin_journal_issue.id,@admin_journal_issue.asignee,"main")
        unless params[:selected].blank?
              id_params = params[:selected]      
              id = convert_to_arr_for_query(id_params)
              @selected_images = Admin::JournalIssueImage.where("id in #{id}")
              @selected_images.each do |image|
                loaded = Cloudinary::Uploader.destroy("journal_issue/images/#{image.id}", :public_id => "journal_issue/files/#{image.id}", :invalidate => true)
              end
              Admin::JournalIssueImage.delete_all "id in #{id}"
         end
         unless params[:selected_files].blank?
              id_params = params[:selected_files]      
              id = convert_to_arr_for_query(id_params)
              @selected_files = Admin::JournalIssueFile.where("id in #{id}")
              @selected_files.each do |file|
                loaded = Cloudinary::Uploader.destroy("journal_issue/files/#{file.id}_#{file.document_file_name}", :invalidate => true, :resource_type => :raw)
              end
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
  
  def destroy_add_rows
    Admin::JournalIssueAsignee.delete_all "journal_issue_id = #{params[:id]} AND admin_id = #{params[:admin_id]}"
    respond_to do |format|
        format.json { head :no_content }
    end
  end

  # DELETE /admin/journal_issues/1
  # DELETE /admin/journal_issues/1.json
  def destroy
    @admin_journal_issue.journal_issue_images.each do |image|
      loaded = Cloudinary::Uploader.destroy("journal_issue/images/#{image.id}", :public_id => "journal_issue/files/#{image.id}", :invalidate => true)
    end
    @admin_journal_issue.journal_issue_files.each do |file|
      loaded = Cloudinary::Uploader.destroy("journal_issue/files/4_admin_login.html", :public_id => "journal_issue/files/4_admin_login.html", :invalidate => true, :resource_type => :raw)
    end
    Admin::JournalIssueFile.delete_all "journal_issue_id = #{@admin_journal_issue.id}"
    Admin::JournalIssueImage.delete_all "journal_issue_id = #{@admin_journal_issue.id}"
    @admin_journal_issue.destroy
    respond_to do |format|
      format.html { redirect_to admin_journals_url }
      format.json { head :no_content }
    end
  end

  def setup_page
    @journals = "selected active"
    @page = "Journal"
  end

  def select_project
    respond_to do |format|
      format.html {render partial: "admin/journals/select_project"}
    end
  end

  def create_project
    respond_to do |format|
      if params[:notices].present?
        format.html {redirect_to new_blank_project_admin_journals_path}
      else
        format.html {redirect_to new_blank_project_admin_journals_path, notice: "You must first have to create a project!"}
      end
    end
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
    def set_admin_journal_issue
      @admin_journal_issue = Admin::JournalIssue.find(params[:id])
    end

    def set_select_project
       admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(params[:admin_id].blank? ? session[:session_admin] : params[:admin_id],nil)
        project = []
        admin_journals.each do |journal|
            project << [journal.title,journal.id]
          end
        @project = project.unshift(['Select',nil])
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

    def update_notif
      update_notif = Admin::JournalIssue.find(params[:id])
      if update_notif.asignee == session[:session_admin]
          update_notif.update_attributes(notif_status: true)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_journal_issue_params
      params.require(:admin_journal_issue).permit(:journal_id, :status_id, :no, :type_id, :priority, :progress, :content, :asignee, :title, :start, :end, :notif_status, :from)
    end

    def set_filter
      @admins = Admin::Profile.all.map{|x|["#{x.name} #{x.last_name}", x.admin_id]}.unshift(['Select',nil])
      project = []
      admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(session[:session_admin],nil)
      admin_journals.each do |journal|
        project << [journal.title,journal.id]
      end
      @project = project.unshift(['Select',nil])
      unless params[:journal_issue_id].blank?
        status = []
        status << Admin::StatusJournal.find(params[:journal_issue_id])
        @status = status.map{|x|[x.name, x.id]}
      else
        @status = Admin::StatusJournal.all.map{|x|[x.name, x.id]}.unshift(['Select',nil])  
      end
      @priority = [ ['Select', nil], ['Urgent',1], ['Hight',2], ['Normal',3] ]
      @progress = [[0,0], [10, 10], [20,20], [30,30], [40,40], [50,50], [60,60], [70,70], [80,80], [90,90], [100,100] ].unshift(['Select',nil])
      @assign = [["None",nil]].unshift(['Select',nil])
    end
end
