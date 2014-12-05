class AddColumnForJournal < ActiveRecord::Migration
  def change
  	add_column :admin_journals, :project_manajer, :string
  	add_column :admin_journals, :designer_id, :integer
  	add_column :admin_journals, :developer_id, :integer
  	add_column :admin_journals, :quality_cek_id, :integer
  end
end
