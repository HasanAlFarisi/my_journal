class ChangeDataTypeInAdminJournalIssuesProgressTable < ActiveRecord::Migration
  def change
  	remove_column :admin_journal_issues, :progress
  	add_column :admin_journal_issues, :progress, :integer
  end
end
