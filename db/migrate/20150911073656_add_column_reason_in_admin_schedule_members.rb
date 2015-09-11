class AddColumnReasonInAdminScheduleMembers < ActiveRecord::Migration
  def change
  	add_column :admin_schedule_members, :reason, :text, after: :status
  end
end
