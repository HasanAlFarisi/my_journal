class CreateAdminJournals < ActiveRecord::Migration
  def change
    create_table :admin_journals do |t|
      t.string :title
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
