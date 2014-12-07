class CreateTemps < ActiveRecord::Migration
  def change
    create_table :temps do |t|
    	t.integer :source_id
      t.timestamps
    end
  end
end
