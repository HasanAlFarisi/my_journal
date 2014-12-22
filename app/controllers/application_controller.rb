class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :prepare_category, :recent_post, :prepare_project, :prepare_advertise

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

  def recent_post
    @recent_posts = Article.order('created_at DESC LIMIT 4')
    @recent_comments =Dashboard::Comment.order('created_at DESC LIMIT 4')
  end

  def convert_to_arr_for_query(ids_param)
    key_string = "("
    ids_param.each do |x|
      key_string << "#{x},"
    end
    key_string[key_string.length-1] = ")"
    key_string
  end

end
