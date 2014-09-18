class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :prepare_category, :recent_post

  def prepare_category
    @categories_list = Admin::Category.all
  end

  def recent_post
  	@articles = Article.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
  end
end
