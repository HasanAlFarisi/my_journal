class AddColumnMoreInformationInAdminProfile < ActiveRecord::Migration
  def change
  	add_column :admin_profiles, :skype, :string
  	add_column :admin_profiles, :birthday, :date
  end
end
