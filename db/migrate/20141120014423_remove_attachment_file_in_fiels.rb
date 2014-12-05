class RemoveAttachmentFileInFiels < ActiveRecord::Migration
  def change
  	remove_attachment :admin_journal_issue_files, :file
  end
end
