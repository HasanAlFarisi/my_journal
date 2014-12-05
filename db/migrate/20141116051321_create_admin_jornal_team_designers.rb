class CreateAdminJornalTeamDesigners < ActiveRecord::Migration
  def change
    create_table :admin_jornal_team_designers do |t|
    	t.integer :journal_id
    	t.integer :admin_id
      t.timestamps
    end
  end
end
