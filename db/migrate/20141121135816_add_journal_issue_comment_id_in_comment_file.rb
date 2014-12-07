class AddJournalIssueCommentIdInCommentFile < ActiveRecord::Migration
  def change
  	add_column :admin_journal_issue_comment_files, :journal_issue_comment_id, :integer, after: :id
  end
end
