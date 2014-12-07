class AddJournalIdJournalTeam < ActiveRecord::Migration
  def change
  	add_column :admin_journal_teams, :journal_id, :integer, after: :id
  end
end
