class CreateAdminProfileSkills < ActiveRecord::Migration
  def change
    create_table :admin_profile_skills do |t|
    	t.string :name
    	t.integer :skill
    	t.integer :profile_id
      t.timestamps
    end
  end
end
