class AddColumnAuthorInSchedule < ActiveRecord::Migration
  def change
  	add_column :admin_schedules, :admin_id, :integer
  end
end
