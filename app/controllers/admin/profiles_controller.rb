class Admin::ProfilesController < Admin::BaseController
  before_action :set_admin_profile, only: [:show, :edit, :update, :destroy]
  skip_before_filter :check_complete_data
  skip_before_filter :verify_authenticity_token, :only => [:update]
  layout "complete", only: [:edit, :update]

  # GET /admin/profiles
  # GET /admin/profiles.json
  def index
    @admin_profiles = Admin::Profile.all
  end

  # GET /admin/profiles/1
  # GET /admin/profiles/1.json
  def show
    @not_current = params[:not_current]
    respond_to do |format|
      format.html
      format.js 
    end
  end

  # GET /admin/profiles/new
  def new
    @admin_profile = Admin::Profile.new
  end

  def new_help
    @help_me = Help.new
  end

  def create_help
    
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
                admin_skill = Admin::ProfileSkill.create({profile_id: @admin_profile.id, name: skill[1][:name], skill: skill[1][:skill]})
                admin_skill.save
            end
        end

        unless params[:admin_profile][:profile_hobbies_attributes].blank?
            params[:admin_profile][:profile_hobbies_attributes].each do |hobby|
                admin_hobby = Admin::ProfileHobby.create({profile_id: @admin_profile.id, name: hobby[1][:name]})
                admin_hobby.save
            end
        end

        format.html { redirect_to admin_root_path, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_profile }
      else
        format.html { render action: 'new'}
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/profiles/1
  # PATCH/PUT /admin/profiles/1.json
  def update
    @not_current = 'no'
    respond_to do |format|
      if @admin_profile.update(admin_profile_params)

        unless params[:admin_profile][:profile_skills_attributes].blank?
            params[:admin_profile][:profile_skills_attributes].each do |skill|
                unless skill[1][:id].present?
                  admin_skill = Admin::ProfileSkill.create({profile_id: @admin_profile.id, name: skill[1][:name], skill: skill[1][:skill]})
                  admin_skill.save
                else
                  admin_skill = Admin::ProfileSkill.find(skill[1][:id]).update({name: skill[1][:name], skill: skill[1][:skill]})
                end
            end
        end

        unless params[:admin_profile][:profile_hobbies_attributes].blank?
            params[:admin_profile][:profile_hobbies_attributes].each do |hobby|
              unless hobby[1][:id].present?
                admin_hobby = Admin::ProfileHobby.create({profile_id: @admin_profile.id, name: hobby[1][:name]})
                admin_hobby.save
              else
                admin_hobby = Admin::ProfileHobby.find(hobby[1][:id]).update({name: hobby[1][:name]})
              end
            end
        end

        format.html { redirect_to admin_root_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
        format.js { @admin_profile }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
        format.js { @admin_profile }
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
      params.require(:admin_profile).permit(:admin_id, :name, :last_name, :facebook, :e_mail, :motto, :describe_me, :avatar, :skype, :birthday)
    end
end
