class AddShowCountInArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :count_view, :integer
  end
end
