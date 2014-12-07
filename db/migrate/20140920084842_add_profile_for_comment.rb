class AddProfileForComment < ActiveRecord::Migration
  def change
  	add_column :dashboard_comments, :profile, :string
  end
end
