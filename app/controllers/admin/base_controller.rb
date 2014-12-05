class Admin::BaseController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!
  before_filter :check_complete_data

  def check_complete_data
  	is_complete = true
  	unless current_admin.profile.is_complete?
  		flash[:alert] = "Please Complete your Profile"
  		redirect_to new_admin_complete_profile_path
  	end
  end
end
