class CreateAdminJournalIssueFiles < ActiveRecord::Migration
  def change
    create_table :admin_journal_issue_files do |t|
    	t.integer :journal_issue_id
    	t.attachment :file
      t.timestamps
    end
  end
end
