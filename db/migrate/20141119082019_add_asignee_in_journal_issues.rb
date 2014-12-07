class AddAsigneeInJournalIssues < ActiveRecord::Migration
  def change
  	add_column :admin_journal_issues, :asignee, :integer, after: :content
  end
end
