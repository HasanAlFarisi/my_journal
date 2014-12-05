class CreateAdminJournalIssueComments < ActiveRecord::Migration
  def change
    create_table :admin_journal_issue_comments do |t|
    	t.integer :journal_issue_id
    	t.integer :admin_id
    	t.text :content
      t.timestamps
    end
  end
end
