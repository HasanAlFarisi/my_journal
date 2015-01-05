class CreateRandClouds < ActiveRecord::Migration
  def change
    create_table :rand_clouds do |t|
    	t.string :type
    	t.integer :type_id
    	t.string :rand
      t.timestamps
    end
  end
end
