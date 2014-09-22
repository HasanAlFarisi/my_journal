class AddAttachmentAvatarForAdminProfile < ActiveRecord::Migration
  def change
  	add_attachment :admin_profiles, :avatar
  end
end
