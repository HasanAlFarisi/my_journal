class Dashboard::ProfilesController < ApplicationController
	before_filter :prepare_select
	
	def show
		@admin_profile = Admin::Profile.find(params[:id])
		@article = @admin_profile
	end

	def prepare_select
	    @profile = [["Annonymous","1.gif"], ["General","2.gif"],["Private","3.gif"],["Geust","4.gif"]].unshift(["Select",nil])
	  end
end
