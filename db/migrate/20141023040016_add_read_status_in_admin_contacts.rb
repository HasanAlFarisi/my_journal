class AddReadStatusInAdminContacts < ActiveRecord::Migration
  def change
  	add_column :admin_contacts, :read_status, :boolean, default: false
  end
end
