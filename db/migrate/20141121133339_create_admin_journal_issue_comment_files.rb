class CreateAdminJournalIssueCommentFiles < ActiveRecord::Migration
  def change
    create_table :admin_journal_issue_comment_files do |t|
    	t.attachment :comment_document
      t.timestamps
    end
  end
end
