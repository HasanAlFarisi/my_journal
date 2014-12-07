class AddGroupIdInAdminGalleries < ActiveRecord::Migration
  def change
  	add_column :admin_galleries, :group_id, :integer
  end
end
