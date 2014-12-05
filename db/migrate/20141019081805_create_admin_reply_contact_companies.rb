class CreateAdminReplyContactCompanies < ActiveRecord::Migration
  def change
    create_table :admin_reply_contact_companies do |t|
    	t.string :body
    	t.integer :contact_company_id
      t.timestamps
    end
  end
end
