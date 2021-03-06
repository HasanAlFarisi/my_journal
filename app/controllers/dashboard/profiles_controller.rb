class Dashboard::ProfilesController < ApplicationController
	before_filter :prepare_select, :prepare_session
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

			format.html {render :partial => "dashboard/profiles/show_admin_profile"}
		end
	end

	def prepare_select
	    	@profile = [["Annonymous","1.gif"], ["General","2.gif"],["Private","3.gif"],["Geust","4.gif"]].unshift(["Select",nil])
	end

	def prepare_session
		session[:current] = "about"
	end

	private
	def admin
		@admin_profile = Admin::Profile.find(params[:profile_id])
	end
end
