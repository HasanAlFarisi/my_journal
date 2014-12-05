class Admin::CompleteProfilesController < ApplicationController
	layout "complete"

	def new
		@admin_profile = Admin::Profile.find_by_admin_id(current_admin.id)
	end
end
