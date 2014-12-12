class AddHelpIdInHelpFiles < ActiveRecord::Migration
  def change
  	add_column :admin_help_files, :help_id, :integer
  end
end
