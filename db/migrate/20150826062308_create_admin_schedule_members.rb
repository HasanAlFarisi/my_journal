class CreateAdminScheduleMembers < ActiveRecord::Migration
  def change
    create_table :admin_schedule_members do |t|
    	t.integer :schedule_id
    	t.integer :admin_id
    	t.string :status
      t.timestamps
    end
  end
end
