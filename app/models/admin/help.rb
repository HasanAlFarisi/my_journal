class Admin::Help < ActiveRecord::Base
	has_many :help_files, dependent: :destroy

	accepts_nested_attributes_for :help_files

	def self.save_attributes(id,params)
		unless params[:admin_help][:help_files_attributes].blank?
			params[:admin_help][:help_files_attributes].each do |image|
				help = Admin::HelpFile.create(help_id: id, document: image[1][:document])
				help.save
				preloaded = Cloudinary::Uploader.upload(image[1][:document], :public_id => "help/images/#{help.id}_#{help.document_file_name}",:resource_type => :auto)
				mailer = AdminMailer.delay(:queue => 'sent_help_for_hasan', :priority => 1).sent_help(id)
			end
		end
	end
end
