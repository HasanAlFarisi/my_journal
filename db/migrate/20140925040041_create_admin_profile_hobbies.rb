class CreateAdminProfileHobbies < ActiveRecord::Migration
  def change
    create_table :admin_profile_hobbies do |t|
    	t.string :name
    	t.integer :profile_id
      t.timestamps
    end
  end
end
