class AddAdminIdInDashboardReplyComments < ActiveRecord::Migration
  def change
  	add_column :dashboard_reply_comments, :admin_id, :integer
  end
end
