class AddColumnDateInSchedule < ActiveRecord::Migration
  def change
  	add_column :admin_schedules, :dates, :date
  end
end
