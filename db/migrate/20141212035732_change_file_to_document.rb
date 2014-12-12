class ChangeFileToDocument < ActiveRecord::Migration
  def change
  	remove_attachment :admin_help_files, :file
  	add_attachment :admin_help_files, :document
  end
end
