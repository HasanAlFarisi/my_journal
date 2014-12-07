class RemoveColumnSubNameInAdminCategories < ActiveRecord::Migration
  def change
  	remove_column :admin_categories, :sub_name
  end
end
