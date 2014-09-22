class Dashboard::HomeController < ApplicationController
	before_filter :prepare_select

  def index
  	@articles = Article.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  	
  end

  def show
  	@article = Article.find(params[:id])
  	@article_comments = Dashboard::Comment.where("article_id = ? ", params[:id])
  end

  def prepare_select
    @profile = [["Annonymous","1.gif"], ["General","2.gif"],["Private","3.gif"],["Geust","4.gif"]].unshift(["Select",nil])
  end
end
