class DropTableAndAddColumnForGalleries < ActiveRecord::Migration
  def change
  	drop_table :admin_gallery_comment_replies
  	add_column :admin_gallery_comments, :admin_id, :integer
  end
end
