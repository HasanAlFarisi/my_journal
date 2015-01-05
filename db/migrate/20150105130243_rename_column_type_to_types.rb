class RenameColumnTypeToTypes < ActiveRecord::Migration
  def change
  	rename_column :rand_clouds, :type, :types
  end
end
