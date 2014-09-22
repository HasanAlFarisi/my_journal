class DeleteColumnCommentIdInArticle < ActiveRecord::Migration
  def change
  	remove_column :articles, :comment_id
  end
end
