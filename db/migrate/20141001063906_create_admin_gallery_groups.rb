class CreateAdminGalleryGroups < ActiveRecord::Migration
  def change
    create_table :admin_gallery_groups do |t|
      t.string :name
      t.string :sub_name

      t.timestamps
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
