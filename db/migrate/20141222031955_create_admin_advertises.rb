class CreateAdminAdvertises < ActiveRecord::Migration
  def change
    create_table :admin_advertises do |t|
      t.attachment :image
      t.boolean :status

      t.timestamps
    end
  end
end
