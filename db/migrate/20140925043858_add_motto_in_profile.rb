class AddMottoInProfile < ActiveRecord::Migration
  def change
  	add_column :admin_profiles, :motto, :text
  end
end
