class CreateAdminReplyContacts < ActiveRecord::Migration
  def change
    create_table :admin_reply_contacts do |t|
    	t.string :body
    	t.integer :contact_id
      t.timestamps
    end
  end
end
