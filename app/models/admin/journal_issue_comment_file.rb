class Admin::JournalIssueCommentFile < ActiveRecord::Base
	belongs_to :journal_issue_comment

	has_attached_file :comment_document
end
