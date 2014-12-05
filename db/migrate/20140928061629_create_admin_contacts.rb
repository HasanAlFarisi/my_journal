class CreateAdminContacts < ActiveRecord::Migration
  def change
    create_table :admin_contacts do |t|
    	t.integer :admin_id
    	t.string :name
    	t.string :email
    	t.text :body
    	t.string :profile
    	
      t.timestamps
    end
  end
end
