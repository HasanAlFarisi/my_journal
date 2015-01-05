class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :prepare_select

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)

    session[:urlBack] = request.original_url
  end
    
  # GET /articles/1
  # GET /articles/1.json
  def show;end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit;end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        unless params[:article][:photo].blank?
          preloaded = Cloudinary::Uploader.upload(params[:article][:photo], :use_filename => true, :public_id => "articles/#{@article.id}")
          rand = RandCloud.generated_rand("articles",@article.id,"/v2#{Random.rand(11)}")
        end
        sub_category = Article.find(@article.id)
        sub_category.update_attributes(sub_category_id: params[:sub_category])

        format.html { redirect_to admin_articles_url, notice: 'Article was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def article_search
    @result = Article.search_by_params(params).paginate(:page => params[:page], :per_page => 15)

    session[:urlBack] = request.original_url

    respond_to do |format|
      format.html
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        unless params[:article][:photo].blank?
          loaded = Cloudinary::Uploader.destroy('article.jpg', :public_id => 'articles/#{@article.id}', :invalidate => true)
          preloaded = Cloudinary::Uploader.upload(params[:article][:photo], :use_filename => true, :public_id => "articles/#{@article.id}")
          rand = RandCloud.generated_rand("articles",@article.id,"/v2#{Random.rand(11)}")
        end
        @article.update_attributes(sub_category_id: params[:sub_category])

        format.html { redirect_to admin_articles_url, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    comment = Dashboard::Comment.delete_all "article_id = #{@article.id}"
    loaded = Cloudinary::Uploader.destroy("articles/#{@article.id}", :public_id => "articles/#{@article.id}", :invalidate => true)
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    unless params[:selected].blank?
      id_params = params[:selected]      
      id = convert_to_arr_for_query(id_params)
      Article.delete_all "id in #{id}"
      Dashboard::Comment.delete_all "article_id in #{id}"
      
      respond_to do |format|
        format.html { redirect_to admin_articles_url }
        format.json { head :no_content }
      end
     end
  end

  def auto_search
    unless params[:category].blank?
      sub_category = Admin::SubCategory.where("category_id = ?", params[:category])
      @sub_category_select = sub_category.map{|x|[x.name, x.id]}.unshift(['Select',nil])
      unless params[:id].blank?
        @sub_category_selected = Article.find(params[:id]).sub_category_id
      end
    else
      @sub_category_select = [['Select', nil]]
    end
    render layout: false
  end

  def auto_search_sidebar
    unless params[:category].blank?
      sub_category = Admin::SubCategory.where("category_id = ?", params[:category])
      @sub_category_sidebar_select = sub_category.map{|x|[x.name, x.id]}.unshift(['Sub Category',nil])
    else
      @sub_category_sidebar_select = [['Sub Category', nil]]
    end
    render layout: false
  end

  def prepare_select
    @category = Admin::Category.all.map{|x| [x.name, x.id]}.unshift(['Select',nil])
    @sub_category_select = [['Select', nil]]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      @selected = @article.category_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :photo, :category_id)
    end
end
