class Admin::ContactsController < ApplicationController
	def create
		@admin_contact = Admin::Contact.new(admin_contact_params)

		if @admin_contact.save
			AdminMailer.mail_notice(params[:dashboard_comment][:name],params[:dashboard_comment][:email],params[:dashboard_comment][:body]).	deliver

			flash[:warning] = 'Your Message has successfully sent.'
		end
	end

	private
	def admin_contact_params
		params.require(:dashboard_comment).permit(:admin_id, :name, :email, :body, :profile)
	end
end
