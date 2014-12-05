class Admin::JournalIssueFile < ActiveRecord::Base
	belongs_to :journal_issue

	has_attached_file :document
end
