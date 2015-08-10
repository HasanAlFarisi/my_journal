class AddColumnFromInJournalIssues < ActiveRecord::Migration
  def change
  	add_column :admin_journal_issues, :from, :integer, after: :asignee
  end
end
