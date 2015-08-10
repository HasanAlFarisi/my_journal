class AddAccessForArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :is_read, :boolean, default: true
  	add_column :articles, :is_edit, :boolean, default: true
  	add_column :articles, :is_delete, :boolean, default: true
  end
end
