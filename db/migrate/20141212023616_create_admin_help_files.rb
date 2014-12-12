class CreateAdminHelpFiles < ActiveRecord::Migration
  def change
    create_table :admin_help_files do |t|
    	t.attachment :file
      t.timestamps
    end
  end
end
