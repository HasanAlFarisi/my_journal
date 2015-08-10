class Admin::CompanyProfilesController < Admin::BaseController
  before_action :set_admin_company_profile, only: [:show, :edit, :update, :destroy]
  before_filter :setup_page
  
  # GET /admin/company_profiles
  # GET /admin/company_profiles.json
  def index
    @admins = Admin::Profile.where("admin_id != ?", current_admin.id).all
    @current_admin = current_admin.profile
    @admin_company_profiles = Admin::CompanyProfile.last
    @admin_journals = Admin::Journal.order("created_at DESC")
    admin_journals = Admin::Journal.order("created_at DESC").is_allowed(current_admin.id,nil)
    ids = []
    @admin_journals.each do |journal|
            ids << journal.id
    end
    id = convert_to_arr_for_query(ids)
    @admin_journals_status = Admin::JournalIssue.find_index_count(id == ")" ? "(0)" : id,current_admin.id,'index')
    ids_all = []
    admin_journals.each do |journal|
        ids_all << journal.id
    end
    ids_all = convert_to_arr_for_query(ids_all)
    @admin_journals_status_all = Admin::JournalIssue.find_index_count(ids_all == ")" ? "(0)" : ids_all ,current_admin.id,'index')
    @messages = Admin::Contact.where("admin_id = ?", current_admin.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)

    @admin_journals_status_count = Admin::Journal.where("id IN #{ids_all == ")" ? "(0)" : ids_all} AND status_id = 6").count

    @articles_count = Article.all.count
    session[:urlBack] = request.original_url
  end

  # GET /admin/company_profiles/1
  # GET /admin/company_profiles/1.json
  def show
  end

  # GET /admin/company_profiles/new
  def new
    @admin_company_profile = Admin::CompanyProfile.new
  end

  # GET /admin/company_profiles/1/edit
  def edit
  end

  # POST /admin/company_profiles
  # POST /admin/company_profiles.json
  def create
    @admin_company_profile = Admin::CompanyProfile.new(admin_company_profile_params)

    respond_to do |format|
      if @admin_company_profile.save
        unless params[:admin_company_profile][:photo].blank?
          preloaded = Cloudinary::Uploader.upload(params[:admin_company_profile][:photo], :use_filename => true, :public_id => "company/#{@admin_company_profile.id}")
        end
        format.html { redirect_to admin_root_url, notice: 'Company profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_company_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/company_profiles/1
  # PATCH/PUT /admin/company_profiles/1.json
  def update
    respond_to do |format|
      if @admin_company_profile.update(admin_company_profile_params)
        unless params[:admin_company_profile][:photo].blank?
          loaded = Cloudinary::Uploader.destroy("company/#{@admin_company_profile.id}", :public_id => "company/#{@admin_company_profile.id}", :invalidate => true)
          preloaded = Cloudinary::Uploader.upload(params[:admin_company_profile][:photo], :use_filename => true, :public_id => "company/#{@admin_company_profile.id}")
          rand = RandCloud.generated_rand("company",@admin_company_profile.id,"/v2#{Random.rand(11)}")
        end
        format.html { redirect_to admin_root_url, notice: 'Company profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/company_profiles/1
  # DELETE /admin/company_profiles/1.json
  def destroy
    @admin_company_profile.destroy
    respond_to do |format|
      format.html { redirect_to admin_company_profiles_url }
      format.json { head :no_content }
    end
  end

  def setup_page
    @dashboard = "selected"
    @page = "Dashboard"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_company_profile
      @admin_company_profile = Admin::CompanyProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_company_profile_params
      params.require(:admin_company_profile).permit(:name, :address, :vission, :mission, :motto, :photo)
    end
end
