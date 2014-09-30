class Admin::ProfilesController < Admin::BaseController
  before_action :set_admin_profile, only: [:show, :edit, :update, :destroy]

  # GET /admin/profiles
  # GET /admin/profiles.json
  def index
    @admin_profiles = Admin::Profile.all
  end

  # GET /admin/profiles/1
  # GET /admin/profiles/1.json
  def show
  end

  # GET /admin/profiles/new
  def new
    @admin_profile = Admin::Profile.new
  end

  # GET /admin/profiles/1/edit
  def edit
    @admin_skills = Admin::ProfileSkill.find_all_by_profile_id(params[:id])
  end

  # POST /admin/profiles
  # POST /admin/profiles.json
  def create
    @admin_profile = Admin::Profile.new(admin_profile_params)

    respond_to do |format|
      if @admin_profile.save
        unless params[:admin_profile][:profile_skills_attributes].blank?
            params[:admin_profile][:profile_skills_attributes].each do |skill|
                admin_skill = Admin::ProfileSkill.create({profile_id: @admin_profile.id, name: skill[1][:name], skill: skill[1][:skill], icon: skill[1][:icon]})
                admin_skill.save
            end
        end

        unless params[:admin_profile][:profile_hobbies_attributes].blank?
            params[:admin_profile][:profile_hobbies_attributes].each do |hobby|
                admin_hobby = Admin::ProfileHobby.create({profile_id: @admin_profile.id, name: hobby[1][:name]})
                admin_hobby.save
            end
        end

        format.html { redirect_to @admin_profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/profiles/1
  # PATCH/PUT /admin/profiles/1.json
  def update
    respond_to do |format|
      if @admin_profile.update(admin_profile_params)
        format.html { redirect_to admin_root_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/profiles/1
  # DELETE /admin/profiles/1.json
  def destroy
    @admin_profile.destroy
    respond_to do |format|
      format.html { redirect_to admin_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_profile
      @admin_profile = Admin::Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_profile_params
      params.require(:admin_profile).permit(:name, :last_name, :facebook, :e_mail, :motto, :describe_me, :avatar, :skype, :birthday)
    end
end
