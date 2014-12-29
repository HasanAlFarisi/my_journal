class CreateAdminGalleryCommentReplies < ActiveRecord::Migration
  def change
    create_table :admin_gallery_comment_replies do |t|
    	t.integer :gallery_comment_id
    	t.string :content
      t.timestamps
    end
  end
end
