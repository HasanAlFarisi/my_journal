class Admin::RegistrationsController < Devise::RegistrationsController
	layout "portal"

	def new
	    super
	end

	def create
	    super
	    if @admin.save
	    	profile = Admin::Profile.create(admin_id: @admin.id, e_mail: @admin.email,name: 'unknow',last_name: 'unknow',motto: 'unknow',describe_me: 'unknow',birthday:Date.today, facebook:'unknow')
	    	profile.save
	    	@id = Admin::Profile.find(profile.id)
	    end
	end
end
