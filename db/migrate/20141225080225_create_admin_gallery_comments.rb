class CreateAdminGalleryComments < ActiveRecord::Migration
  def change
    create_table :admin_gallery_comments do |t|
    	t.integer :gallery_id
    	t.string :name
    	t.string :email
    	t.string :body
      t.timestamps
    end
  end
end
