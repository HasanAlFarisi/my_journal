class RemoveColumnInJournal < ActiveRecord::Migration
  def change
  	remove_column :admin_journals, :project_manajer
  	remove_column :admin_journals, :designer_id
  	remove_column :admin_journals, :developer_id
  	remove_column :admin_journals, :quality_cek_id
  end
end
