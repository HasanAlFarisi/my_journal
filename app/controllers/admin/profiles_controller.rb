class Admin::ProfilesController < Admin::BaseController
  before_action :set_admin_profile, only: [:show, :edit, :update, :destroy]
  skip_before_filter :check_complete_data
  skip_before_filter :verify_authenticity_token, :only => [:update]
  #layout "complete", :only => [:edit, :update]

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
      format.html {render :partial => "admin/profiles/show"}
      #format.js 
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
    respond_to do |format|
      format.html {render :partial => "admin/profiles/forms/form_#{params[:tab]}"}
    end
  end

  # POST /admin/profiles
  # POST /admin/profiles.json
  def create
    @admin_profile = Admin::Profile.new(admin_profile_params)

    respond_to do |format|
      if @admin_profile.save
        unless params[:admin_profile][:avatar].blank?
          preloaded = Cloudinary::Uploader.upload(params[:admin_profile][:avatar], :use_filename => true, :public_id => "profiles/#{@admin_profile.id}")
        end

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
    unless session[:session_admin].present?
      session[:session_admin] = current_admin.id
    end
    @not_current = 'no'
    @tab = params[:tab]
    respond_to do |format|
      if @admin_profile.update(admin_profile_params)
        Admin.find(current_admin.id).update_attributes(email: params[:admin_profile][:e_mail])
        unless params[:admin_profile][:avatar].blank?
          loaded = Cloudinary::Uploader.destroy("company/#{@admin_profile.id}", :public_id => "profiles/#{@admin_profile.id}", :invalidate => true)
          preloaded = Cloudinary::Uploader.upload(params[:admin_profile][:avatar], :use_filename => true, :public_id => "profiles/#{@admin_profile.id}")
          rand = RandCloud.generated_rand("profile",@admin_profile.id,"/v2#{Random.rand(11)}")
        end

        unless params[:admin_profile][:profile_skills_attributes].blank?
            params[:admin_profile][:profile_skills_attributes].each do |skill|
                unless skill[1][:id].present?
                  admin_skill = Admin::ProfileSkill.create({profile_id: @admin_profile.id, name: skill[1][:name], skill: skill[1][:skill]})
                  admin_skill.save
                else
                  unless params[:selected].blank?           
                      ids_param = params[:selected]
                      ids = convert_to_arr_for_query(ids_param)
                      Admin::ProfileSkill.delete_all "id in #{ids}"
                  else
                      admin_skill = Admin::ProfileSkill.find(skill[1][:id]).update({name: skill[1][:name], skill: skill[1][:skill]})
                  end
                end
            end
        end

        unless params[:admin_profile][:profile_hobbies_attributes].blank?
            params[:admin_profile][:profile_hobbies_attributes].each do |hobby|
              unless hobby[1][:id].present?
                admin_hobby = Admin::ProfileHobby.create({profile_id: @admin_profile.id, name: hobby[1][:name]})
                admin_hobby.save
              else
                    unless params[:selected].blank?           
                          ids_param = params[:selected]
                          ids = convert_to_arr_for_query(ids_param)
                          Admin::ProfileHobby.delete_all "id in #{ids}"
                    else
                          admin_hobby = Admin::ProfileHobby.find(hobby[1][:id]).update({name: hobby[1][:name]})
                    end
              end
            end
        end
        format.html { redirect_to admin_root_path, notice: 'Photo Profile was successfully updated.'}
        format.json { head :no_content}
        format.js
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
