class AddColumnStartAndEndTimeInSchedule < ActiveRecord::Migration
  def change
  	add_column :admin_schedules, :start_time, :time
  	add_column :admin_schedules, :end_time, :time
  end
end
