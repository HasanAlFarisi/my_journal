class AddColumnGalleryGroupIdInGalleries < ActiveRecord::Migration
  def change
  	add_column :admin_galleries, :gallery_group_id, :integer
  end
end
