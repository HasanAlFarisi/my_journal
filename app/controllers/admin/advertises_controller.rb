class Admin::AdvertisesController < Admin::BaseController
  before_action :set_admin_advertise, only: [:show, :edit, :update, :destroy]

  # GET /admin/advertises
  # GET /admin/advertises.json
  def index
    @admin_advertises = Admin::Advertise.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)

    session[:urlBack] = request.original_url
  end

  # GET /admin/advertises/1
  # GET /admin/advertises/1.json
  def show
  end

  # GET /admin/advertises/new
  def new
    @admin_advertise = Admin::Advertise.new
  end

  # GET /admin/advertises/1/edit
  def edit
    respond_to do |format|
      @admin_advertise.on_status_true = true if params[:status] == "true"
      if @admin_advertise.update(status: params[:status])
        format.html { redirect_to admin_advertises_path, notice: 'Advertise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_advertises_path, alert: "Advertise can't showing more than 4 Images" }
        format.json { render json: @admin_advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_lock
      @admin_advertise = Admin::Advertise.find(params[:id])
      @admin_advertise.update(key: params[:key])
  end

  def edit_lock_open
      @admin_advertise = Admin::Advertise.find(params[:id])
      @admin_advertise.update(link: "http://#{params[:link]}",key: params[:key])
  end

  # POST /admin/advertises
  # POST /admin/advertises.json
  def create
    @admin_advertise = Admin::Advertise.new(admin_advertise_params)

    respond_to do |format|
      @admin_advertise.on_status_true = true if params[:admin_advertise][:status] == "true"
      if @admin_advertise.save
        unless params[:admin_advertise][:image].blank?
          preloaded = Cloudinary::Uploader.upload(params[:admin_advertise][:image], :use_filename => true, :public_id => "advertises/#{@admin_advertise.id}")
        end
        format.html { redirect_to admin_advertises_path, notice: 'Advertise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_advertise }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/advertises/1
  # PATCH/PUT /admin/advertises/1.json
  def update
    respond_to do |format|
      if @admin_advertise.update(admin_advertise_params)
        format.html { redirect_to @admin_advertise, notice: 'Advertise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/advertises/1
  # DELETE /admin/advertises/1.json
  def destroy
    loaded = Cloudinary::Uploader.destroy("advertises/#{@admin_advertise.id}", :public_id => "advertises/#{@admin_advertise.id}", :invalidate => true)
    @admin_advertise.destroy
    respond_to do |format|
      format.html { redirect_to admin_advertises_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_advertise
      @admin_advertise = Admin::Advertise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_advertise_params
      params.require(:admin_advertise).permit(:image, :status, :link)
    end
end
