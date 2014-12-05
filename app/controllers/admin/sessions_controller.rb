class Admin::SessionsController < Devise::SessionsController
  layout "portal"

  def new
    @admin = Admin.new
  end

  def create 
    self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
      respond_to do |format|
        format.html {redirect_to "/admin" }
      end
  end

  def failure
    respond_to do |format|
      format.html do
        redirect_to "/admin/login", :flash => {:error => "Username or Password is Incorrect"}
      end
    end
  end

end
