class Admin::SessionsController < Devise::SessionsController
  layout "portal"

  def new
    @admin = Admin.new
  end

  def create 
    self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    session[:session_admin] = current_admin.id
    flash[:notice] = "Signed in successfully. <i class='fa fa-folder-open'></i><b>&nbsp;Hello ! </b><b>#{find_profile(session[:session_admin]).name} #{find_profile(session[:session_admin]).last_name}</b> Welcome Back in <b>JournalKreativ</b>"
      respond_to do |format|
        format.html {redirect_to "/admin" }
      end
  end

  def find_profile(admin_id)
    Admin::Profile.find_by_admin_id(admin_id)
  end

  def failure
    respond_to do |format|
      format.html do
        redirect_to "/admin/login", :flash => {:error => "Username or Password is Incorrect"}
      end
    end
  end

end
