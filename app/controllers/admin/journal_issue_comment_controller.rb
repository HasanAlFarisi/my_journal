class Admin::JournalIssueCommentController < ApplicationController
	  skip_before_filter :verify_authenticity_token, :only => [:create]
	def create
		@admin_journal_issue_comment = Admin::JournalIssueComment.new(admin_journal_issue_comment_params)
		respond_to do |format|
			if @admin_journal_issue_comment.save
				Admin::JournalIssueComment.save_nasted_attributes(@admin_journal_issue_comment.id,params)
				format.html {redirect_to admin_journal_issue_path(id: find_all_id(@admin_journal_issue_comment.journal_issue_id, 1), id_journal:find_all_id(@admin_journal_issue_comment.journal_issue_id, 2))}
				format.js
			end
		end
	end

	private
	def admin_journal_issue_comment_params
		params.require(:admin_journal_issue_comment).permit(:journal_issue_id, :admin_id, :content)
	end

	def find_all_id(journal_issue_id, type)
		all_id = Admin::JournalIssue.find(journal_issue_id)
		if type == 2
			all_id = all_id.journal_id
		else
			all_id.id
		end
	end
end
