class AddColumnAdminIdInAdminProfile < ActiveRecord::Migration
  def change
  	add_column :admin_profiles, :admin_id, :integer, after: :id
  end
end
