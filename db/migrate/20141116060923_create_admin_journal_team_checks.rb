class CreateAdminJournalTeamChecks < ActiveRecord::Migration
  def change
    create_table :admin_journal_team_checks do |t|
    	t.integer :journal_id
    	t.integer :admin_id
      t.timestamps
    end
  end
end
