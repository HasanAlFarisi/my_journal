class AddSubNameForCategory < ActiveRecord::Migration
  def change
  	add_column :admin_categories, :sub_name, :string
  end
end
