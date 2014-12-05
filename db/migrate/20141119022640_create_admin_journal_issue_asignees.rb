class CreateAdminJournalIssueAsignees < ActiveRecord::Migration
  def change
    create_table :admin_journal_issue_asignees do |t|
    	t.integer :journal_issue_id
    	t.integer :admin_id
      t.timestamps
    end
  end
end
