class CreateAdminSchedules < ActiveRecord::Migration
  def change
    create_table :admin_schedules do |t|
    	t.string :title
    	t.string :place
    	t.text :description
    	t.boolean :privacy, default: true
      t.timestamps
    end
  end
end
