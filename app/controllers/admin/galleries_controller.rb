class Admin::GalleriesController < Admin::BaseController
  before_action :set_admin_gallery, only: [:show, :edit, :update, :destroy]
  before_filter :setup_page
  # GET /admin/galleries
  # GET /admin/galleries.json
  def index
    @galleries_all = Admin::Gallery.all
    @galleries = Admin::Gallery.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
    session[:urlBack] = request.original_url
    @page_breadcump = " > Index"
  end

  # GET /admin/galleries/1
  # GET /admin/galleries/1.json
  def show
  end

  # GET /admin/galleries/new
  def new
    @admin_gallery = Admin::Gallery.new
    @page_breadcump = " > form"
  end

  # GET /admin/galleries/1/edit
  def edit
  end

  # POST /admin/galleries
  # POST /admin/galleries.json
  def create
    @admin_gallery = Admin::Gallery.new(admin_gallery_params)

    respond_to do |format|
      if @admin_gallery.save
        unless params[:admin_gallery][:photo].blank?
          preloaded = Cloudinary::Uploader.upload(params[:admin_gallery][:photo], :use_filename => true, :public_id => "galleries/#{@admin_gallery.id}")
        end

        Admin::Gallery.save_attributes(params[:admin_gallery][:gallery_group_id],params)
        unless params[:admin_gallery_group].blank?
            Admin::Gallery.save_attributes(params[:admin_gallery][:gallery_group_id],params[:admin_gallery_group])
        end
        format.html { redirect_to admin_galleries_path(group_id: params[:admin_gallery][:gallery_group_id]), notice: 'Gallery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_reply
    @create_reply = Admin::GalleryCommentReply.create(gallery_comment_id: params[:id], content:params[:content])
    @create_reply.save
  end

  # PATCH/PUT /admin/galleries/1
  # PATCH/PUT /admin/galleries/1.json
  def update
    respond_to do |format|
      if @admin_gallery.update(admin_gallery_params)
        unless params[:admin_gallery][:photo].blank?
          loaded = Cloudinary::Uploader.destroy("galleries/#{@admin_gallery.id}", :public_id => "galleries/#{@admin_gallery.id}", :invalidate => true)
          preloaded = Cloudinary::Uploader.upload(params[:admin_gallery][:photo], :use_filename => true, :public_id => "galleries/#{@admin_gallery.id}")
        end
        format.html { redirect_to @admin_gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/galleries/1
  # DELETE /admin/galleries/1.json
  def destroy
    loaded = Cloudinary::Uploader.destroy("galleries/#{@admin_gallery.id}", :public_id => "galleries/#{@admin_gallery.id}", :invalidate => true)
    @admin_gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_galleries_path(group_id: params[:group_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_gallery
      @admin_gallery = Admin::Gallery.find(params[:id])
    end

    def setup_page
      @galleries_setup = "selected active"
      @page = "Galleries"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_gallery_params
      params.require(:admin_gallery).permit(:title, :photo, :content, :gallery_group_id)
    end
end
