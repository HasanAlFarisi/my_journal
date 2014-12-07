class CreateAdminContactCompanies < ActiveRecord::Migration
  def change
    create_table :admin_contact_companies do |t|
    	t.integer :admin_id
    	t.string :name
    	t.string :email
    	t.string :body
    	t.string :profile
      t.timestamps
    end
  end
end
