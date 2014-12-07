class CreateAdminJournalIssueImages < ActiveRecord::Migration
  def change
    create_table :admin_journal_issue_images do |t|
    	t.integer :journal_issue_id
    	t.attachment :image
      t.timestamps
    end
  end
end
