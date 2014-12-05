class AddColumnAndRenameColumnInJournalIssues < ActiveRecord::Migration
  def change
  	rename_column :admin_journal_issues, :status, :status_id
  	add_column :admin_journal_issues, :type_id, :integer, after: :no
  	add_column :admin_journal_issues, :priority, :integer, after: :type_id
  	add_column :admin_journal_issues, :progress, :string, after: :priority
  	add_column :admin_journal_issues, :content, :text, after: :progress
  end
end
