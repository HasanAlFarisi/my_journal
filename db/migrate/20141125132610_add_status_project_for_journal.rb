class AddStatusProjectForJournal < ActiveRecord::Migration
  def change
  	add_column :admin_journals, :status_id, :integer, after: :title
  end
end
