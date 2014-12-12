class CreateAdminHelps < ActiveRecord::Migration
  def change
    create_table :admin_helps do |t|
      t.string :full_name
      t.string :e_mail
      t.text :help

      t.timestamps
    end
  end
end
