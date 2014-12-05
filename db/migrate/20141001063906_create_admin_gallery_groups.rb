class CreateAdminGalleryGroups < ActiveRecord::Migration
  def change
    create_table :admin_gallery_groups do |t|
      t.string :name
      t.string :sub_name

      t.timestamps
    end
  end
end