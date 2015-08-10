class Dashboard::HomeController < ApplicationController
	before_filter :prepare_select, :prepare_article_default, :prepare_session
      skip_before_filter :verify_authenticity_token, :only => [:search_articles, :subscribe]
  def index
      @articles = @articles_default
      session[:url_back_dashboard] = request.original_url
      session[:ip] = request.remote_ip
      respond_to do |format|
        format.html
      end
  end

  def show
       @status = "Article"
  	@article = Article.find(params[:id])
  	@article_comments = Dashboard::Comment.where("article_id = ? ", params[:id]).order("id DESC")
       @similiar_articles = Article.where("(category_id = ? OR sub_category_id = ?) AND id NOT IN (?)", @article.category_id, @article.sub_category_id, params[:id]).limit(4).order("id DESC");
       if request.remote_ip != session[:ip]
          result = @article.count_view.blank? ? 0 : @article.count_view
          result = result + 1
          @article.update_attributes(count_view: result)
       end
  end

  def search_articles
    @articles = Article.where("LOWER(title) like '%#{params[:title]}%'").order("created_at DESC").paginate(:page => params[:page], :per_page => 5  )
  end

  def prepare_select
    @profile = [["Annonymous","1.gif"], ["General","2.gif"],["Private","3.gif"],["Geust","4.gif"]].unshift(["Select",nil])
  end

  def show_categories
    unless params[:home_id].blank?
      @articles = Article.where("category_id = ?", params[:home_id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5  )
    else
      @articles = @articles_default
    end

    session[:url_back_dashboard] = request.original_url

    respond_to do |format|
      format.html
    end
  end

  def show_sub_categories
    unless params[:home_id].blank?
      @articles = Article.where("sub_category_id = ? ", params[:home_id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5  )  
    else
      @articles = @articles_default
    end

    session[:url_back_dashboard] = request.original_url
    
    respond_to do |format|
      format.html
    end
  end

  def subscribe
    if params[:email].present?
      @error = false
    else
      @error = true
    end
  end

  def prepare_article_default
    @articles_default = Article.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  def prepare_session
      session[:current] = nil
  end
end
