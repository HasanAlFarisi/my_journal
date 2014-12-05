class CreateAdminGalleries < ActiveRecord::Migration
  def change
    create_table :admin_galleries do |t|
      t.string :title
      t.attachment :photo

      t.timestamps
    end
  end
end
