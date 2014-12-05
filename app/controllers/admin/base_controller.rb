class Admin::BaseController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!
<<<<<<< HEAD
  before_filter :check_complete_data

  def check_complete_data
  	is_complete = true
  	unless current_admin.profile.is_complete?
  		flash[:alert] = "Please Complete your Profile"
  		redirect_to new_admin_complete_profile_path
  	end
  end
=======
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
end
