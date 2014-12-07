class CreateDashboardReplyComments < ActiveRecord::Migration
  def change
    create_table :dashboard_reply_comments do |t|
    	t.string :body
    	t.integer :comment_id
      t.timestamps
    end
  end
end
