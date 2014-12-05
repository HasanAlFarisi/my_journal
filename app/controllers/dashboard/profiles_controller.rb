class Dashboard::ProfilesController < ApplicationController
	before_filter :prepare_select
<<<<<<< HEAD
	before_action :admin, only: [:show_admin]
	
	def show
		@company_profile = Admin::CompanyProfile.last
		@company_comments = Admin::ContactCompany.where("admin_id = ? ", @company_profile.id)
		@article = @company_profile
		@admins = Admin::Profile.all
	end

	def show_admin
		@admin_comments = Admin::Contact.find_all_by_admin_id(params[:profile_id])

		respond_to do |format|
			format.js
			format.html {render :partial => "dashboard/profiles/show_admin_profile", locals: {admin: @admin, admin_comments: @admin_comments}, :status => 200}
		end
	end

	def prepare_select
	    	@profile = [["Annonymous","1.gif"], ["General","2.gif"],["Private","3.gif"],["Geust","4.gif"]].unshift(["Select",nil])
	end

	private
	def admin
		@admin = Admin::Profile.find(params[:profile_id])
	end
=======
	
	def show
		@admin_profile = Admin::Profile.find(params[:id])
		@article = @admin_profile
	end

	def prepare_select
	    @profile = [["Annonymous","1.gif"], ["General","2.gif"],["Private","3.gif"],["Geust","4.gif"]].unshift(["Select",nil])
	  end
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
end
