class CreateAdminGalleryLikes < ActiveRecord::Migration
  def change
    create_table :admin_gallery_likes do |t|
    	t.integer :gallery_id
    	t.string :current_ip
      t.timestamps
    end
  end
end
