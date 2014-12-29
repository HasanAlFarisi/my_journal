class AddTitleAndContentForGalleryPhoto < ActiveRecord::Migration
  def change
  	add_column :admin_galleries, :content, :text, after: :title
  end
end
