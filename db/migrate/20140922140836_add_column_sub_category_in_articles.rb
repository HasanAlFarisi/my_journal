class AddColumnSubCategoryInArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :sub_category_id, :integer
  end
end
