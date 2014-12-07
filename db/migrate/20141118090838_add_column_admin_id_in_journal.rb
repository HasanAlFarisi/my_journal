class AddColumnAdminIdInJournal < ActiveRecord::Migration
  def change
  	add_column :admin_journals, :admin_id, :integer
  end
end
