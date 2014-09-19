class Dashboard::HomeController < ApplicationController
  def index
  	@articles = Article.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def show
  	@article = Article.find(params[:id])
  end
end
