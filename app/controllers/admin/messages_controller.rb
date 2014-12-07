class Admin::MessagesController < Admin::BaseController
	before_action :set_message, only: [:show, :destroy]

	def index
		@messages = Admin::Contact.where("admin_id = ?", current_admin.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	def show
		@message_admin.update(read_status: true)
		respond_to do |format|
			format.js
		end
	end

	def create_reply_contact_for_admin
		reply_contact = Admin::ReplyContact.create(body: params[:body_reply], contact_id: params[:contact_id])
		reply_contact.save

		@reply_contacts = Admin::ReplyContact.where("contact_id = ?", reply_contact.contact_id)
		@reply_contact = Admin::ReplyContact.where("contact_id = ?", reply_contact.contact_id).last

		respond_to do |format|
			format.js
		end
	end

	def destroy
		reply_message = Admin::ReplyContact.delete_all "contact_id = #{@message_admin.id}"
		@message_admin.destroy
		
		respond_to do |format|
      			format.html { redirect_to admin_messages_url }
      			flash[:notice] = "Message was successfully deleted."
      		end
	end

	def destroy_reply
		destroy_reply = Admin::ReplyContact.find(params[:message_id])
		@message_admin = Admin::Contact.find(destroy_reply.contact_id)
		destroy_reply.destroy

		@reply_contacts = Admin::ReplyContact.where("contact_id = ?", @message_admin.id)

		respond_to do |format|
			format.js
		end
	end

	private
	def set_message
		@message_admin = Admin::Contact.find(params[:id])
	end
end
