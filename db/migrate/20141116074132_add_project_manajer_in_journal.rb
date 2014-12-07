class AddProjectManajerInJournal < ActiveRecord::Migration
  def change
  	add_column :admin_journals, :project_manajer, :string, after: :title
  end
end
