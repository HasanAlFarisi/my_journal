class CreateAdminJournalTeams < ActiveRecord::Migration
  def change
    create_table :admin_journal_teams do |t|
    	t.string :project_manajer
  	t.integer :designer_id
  	t.integer :developer_id
  	t.integer :quality_cek_id
      t.timestamps
    end
  end
end
