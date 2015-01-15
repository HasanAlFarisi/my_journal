class Admin::JournalIssueComment < ActiveRecord::Base
	belongs_to :journal_issue

	has_many :journal_issue_comment_files, dependent: :destroy
	accepts_nested_attributes_for :journal_issue_comment_files

	def self.save_nasted_attributes(id,params)
		unless params[:admin_journal_issue_comment][:journal_issue_comment_files_attributes].blank?
			params[:admin_journal_issue_comment][:journal_issue_comment_files_attributes].each do |document|
				unless document[1][:id].present?
					save_data = Admin::JournalIssueCommentFile.create({journal_issue_comment_id: id, comment_document: document[1][:comment_document]})
					save_data.save
					preloaded = Cloudinary::Uploader.upload(file[1][:comment_document], :public_id => "journal_issue/files/#{save_data.id}_#{save_data.comment_document_file_name}",:resource_type => :auto)
				else
					save_data = Admin::JournalIssueCommentFile.find(document[1][:id]).update({comment_document: document[1][:comment_document]})
				end
			end
		end
	end
end
