class AddProjectDescriptionInJournal < ActiveRecord::Migration
  def change
  	add_column :admin_journals, :description, :text
  end
end
