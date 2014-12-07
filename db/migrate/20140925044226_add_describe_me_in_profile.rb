class AddDescribeMeInProfile < ActiveRecord::Migration
  def change
  	add_column :admin_profiles, :describe_me, :text
  end
end
