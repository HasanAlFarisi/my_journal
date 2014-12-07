class DeleteTableJournalTeam < ActiveRecord::Migration
  def change
  	drop_table :admin_journal_teams
  end
end
