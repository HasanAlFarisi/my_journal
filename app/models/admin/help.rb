class Admin::Help < ActiveRecord::Base
	has_many :help_files, dependent: :destroy

	accepts_nested_attributes_for :help_files

	def self.save_attributes(id,params)
		unless params[:admin_help][:help_files_attributes].blank?
			params[:admin_help][:help_files_attributes].each do |image|
				help = Admin::HelpFile.create(help_id: id, document: image[1][:document])
				help.save
				mailer = AdminMailer.sent_help(id).deliver
			end
		end
	end
end
