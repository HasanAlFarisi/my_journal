class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|
      t.string :name
      t.string :last_name
      t.string :facebook
      t.string :e_mail
      t.integer :admin_skill_id
      t.integer :admin_hobby_id

      t.timestamps
    end
  end
end
