class AddAttachmentForIconInProfile < ActiveRecord::Migration
  def change
  	add_attachment :admin_profile_skills, :icon
  end
end
