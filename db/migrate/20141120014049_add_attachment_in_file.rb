class AddAttachmentInFile < ActiveRecord::Migration
  def change
  	add_attachment :admin_journal_issue_files, :document
  end
end
