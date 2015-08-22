class DropTableAdminGalleryGroups < ActiveRecord::Migration
  def change
  	drop_table :admin_gallery_groups
  	remove_column :admin_galleries, :group_id
  end
end
