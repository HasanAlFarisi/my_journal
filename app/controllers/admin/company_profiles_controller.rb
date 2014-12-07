class Admin::CompanyProfilesController < Admin::BaseController
  before_action :set_admin_company_profile, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/company_profiles
  # GET /admin/company_profiles.json
  def index
    @admins = Admin::Profile.where("admin_id != ?", current_admin.id).all
    @current_admin = current_admin.profile
    @admin_company_profiles = Admin::CompanyProfile.last
    @admin_journals = Admin::Journal.order("created_at DESC")
    ids = []
    @admin_journals.each do |journal|
            ids << journal.id
    end
    id = convert_to_arr_for_query(ids)
    @admin_journals_status = Admin::JournalIssue.find_index_count(id,current_admin.id)
    
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
