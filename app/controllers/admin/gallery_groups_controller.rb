class Admin::GalleryGroupsController < Admin::BaseController
  before_action :set_admin_gallery_group, only: [:show, :edit, :update, :destroy]

  # GET /admin/gallery_groups
  # GET /admin/gallery_groups.json
  def index
    @admin_gallery_groups = Admin::GalleryGroup.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
    session[:urlBack] = request.original_url
  end

  # GET /admin/gallery_groups/1
  # GET /admin/gallery_groups/1.json
  def show
  end

  # GET /admin/gallery_groups/new
  def new
    @admin_gallery_group = Admin::GalleryGroup.new
  end

  # GET /admin/gallery_groups/1/edit
  def edit
    @admin_galleries = Admin::Gallery.where("gallery_group_id = ? ", params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  # POST /admin/gallery_groups
  # POST /admin/gallery_groups.json
  def create
    @admin_gallery_group = Admin::GalleryGroup.new(admin_gallery_group_params)

    respond_to do |format|
      if @admin_gallery_group.save
        Admin::Gallery.save_attributes(@admin_gallery_group.id,params[:admin_gallery_group])
        format.html { redirect_to admin_gallery_groups_path, notice: 'Gallery group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_gallery_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_gallery_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/gallery_groups/1
  # PATCH/PUT /admin/gallery_groups/1.json
  def update
    respond_to do |format|
      if @admin_gallery_group.update(admin_gallery_group_params)
        Admin::Gallery.save_attributes(@admin_gallery_group.id,params[:admin_gallery_group])
        format.html { redirect_to admin_galleries_path(group_id: @admin_gallery_group.id), notice: 'Gallery group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_gallery_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/gallery_groups/1
  # DELETE /admin/gallery_groups/1.json
  def destroy
    @admin_gallery_group.galleries.each do |admin_gallery|
      loaded = Cloudinary::Uploader.destroy("galleries/#{admin_gallery.id}", :public_id => "galleries/#{admin_gallery.id}", :invalidate => true)
    end
    @admin_gallery_group.destroy
    respond_to do |format|
      format.html { redirect_to admin_gallery_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_gallery_group
      @admin_gallery_group = Admin::GalleryGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_gallery_group_params
      params.require(:admin_gallery_group).permit(:name, :sub_name)
    end
end
