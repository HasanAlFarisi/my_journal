class RemoveColumnSkillIdAndHobbyIdInAdminProfile < ActiveRecord::Migration
  def change
  	remove_column :admin_profiles, :admin_skill_id
  	remove_column :admin_profiles, :admin_hobby_id
  end
end
