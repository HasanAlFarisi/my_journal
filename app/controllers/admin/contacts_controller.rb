class Admin::ContactsController < ApplicationController
	before_action :set_company_comment, only: [:show, :destroy]

	#this method for create comment to admin member, or in other word is contact to admin member
	def create
		@admin_contact = Admin::Contact.new(admin_contact_params)

		if @admin_contact.save
			AdminMailer.delay(:queue => 'notification_to_admin', :priority => 2).mail_notice(params[:profile_email],params[:dashboard_comment][:name],params[:dashboard_comment][:email],params[:dashboard_comment][:body])
			#respond_to do |format|
				@comment = Admin::Contact.last
			#	format.js
			#end
		end
	end

	#this method for create comment to company, or in other word is contact to company
	def create_notification_for_all_admins
		company_comment = Admin::ContactCompany.new(admin_company_contact_params)
		if company_comment.save
			#mailer for All Admins
			admins = Admin.all
			admins.each do |admin|
				AdminMailer.delay(:queue => 'notification_for_all_admin', :priority => 2).notification_for_all_admins(params[:dashboard_comment],admin)
			end

			respond_to do |format|
				@company_comments = Admin::ContactCompany.last
				format.js
			end
		end
	end

	#this method for create reply comment to company
	def create_reply_contact
		reply_contact = Admin::ReplyContactCompany.create(body: params[:body_reply], contact_company_id: params[:contact_id])
		reply_contact.save

		respond_to do |format|
			format.js {@reply_contact = Admin::ReplyContactCompany.where('contact_company_id = ?', reply_contact.contact_company_id).last}
		end
	end

	def show
		respond_to do |format|
			format.js
		end
	end

	def destroy
		destroy_reply = Admin::ReplyContactCompany.delete_all "contact_company_id = #{@company_comment.id}"
		@company_comment.destroy
		respond_to do |format|
			format.html { redirect_to admin_root_url }
		end
		flash[:notice] = 'Comment was successfully deleted.'
	end

	def destroy_reply
		reply_contact = Admin::ReplyContactCompany.find(params[:contact_id])
		reply_contact.destroy

		respond_to do |format|
			format.json {head :no_content}
		end
	end

	private
	def set_company_comment
		@company_comment = Admin::ContactCompany.find(params[:id])
	end

	def admin_contact_params
		params.require(:dashboard_comment).permit(:admin_id, :name, :email, :body, :profile)
	end

	def admin_company_contact_params
		params.require(:dashboard_comment).permit(:admin_id, :name, :email, :body, :profile)
	end
end
