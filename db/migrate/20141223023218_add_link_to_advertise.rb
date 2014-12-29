class AddLinkToAdvertise < ActiveRecord::Migration
  def change
  	add_column :admin_advertises, :link, :string
  end
end
