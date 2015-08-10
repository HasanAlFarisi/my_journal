class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :prepare_category, :recent, :prepare_project, :prepare_advertise, :prepare_galleries, :notice_header, :calendar

  def prepare_category
    @categories_list = Admin::Category.all
    @categories_select = Admin::Category.all.map{|x| [x.name , x.id]}.unshift(['Category',nil])
  end

  def prepare_project
    unless current_admin.blank?
      begin
        unless current_admin.admin_id.blank?
            @admin_journalses = Admin::Journal.order("created_at DESC").is_allowed(current_admin.admin_id,nil)   
        end
      rescue
        @admin_journalses = Admin::Journal.order("created_at DESC").is_allowed(current_admin.id,nil)
      end
    end
    @journal_statuses = Admin::StatusJournal.all
  end

  def prepare_advertise
    @admin_advertises = Admin::Advertise.order("created_at DESC").where("status = true")
  end

  def recent
    @recent_posts = Article.order('created_at DESC LIMIT 4')
    @popular_posts = Article.order('count_view DESC LIMIT 4')
  end

  def prepare_galleries
      @galleries = Admin::GalleryGroup.order("created_at DESC LIMIT 10")
  end

  def notice_header
    @messages_notif = Admin::Contact.where("admin_id = ? AND read_status = false", session[:session_admin]).order("created_at DESC")
    @admin_journals_notif =  Admin::Journal.order("created_at DESC")
    ids = []
    @admin_journals_notif.each do |journal|
            ids << journal.id
    end
    id = convert_to_arr_for_query(ids)
    @admin_journals_status_notif = Admin::JournalIssue.find_index_count_notif(id == ")" ? "(0)" : id,session[:session_admin],'notif')
    @article_comment_notif = Dashboard::Comment.all
  end

  def convert_to_arr_for_query(ids_param)
    key_string = "("
    ids_param.each do |x|
      key_string << "#{x},"
    end
    key_string[key_string.length-1] = ")"
    key_string
  end

  def calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    #@events_by_date = Event.group_by(&:date)
  end

end
