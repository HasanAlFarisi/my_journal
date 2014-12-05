class CreateAdminStatusJournals < ActiveRecord::Migration
  def change
    create_table :admin_status_journals do |t|
    	t.string :name
      t.timestamps
    end
  end
end
