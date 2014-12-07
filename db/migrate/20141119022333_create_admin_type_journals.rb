class CreateAdminTypeJournals < ActiveRecord::Migration
  def change
    create_table :admin_type_journals do |t|
    	t.string :name
      t.timestamps
    end
  end
end
