class AddJournalIssueNotifStatus < ActiveRecord::Migration
  def change
  	add_column :admin_journal_issues, :notif_status, :boolean, default: false
  end
end
