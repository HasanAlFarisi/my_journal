class AddKeyInAdvertises < ActiveRecord::Migration
  def change
  	add_column :admin_advertises, :key, :string, default: "lock"
  end
end
