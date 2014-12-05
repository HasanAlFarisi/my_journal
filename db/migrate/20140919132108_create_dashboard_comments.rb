class CreateDashboardComments < ActiveRecord::Migration
  def change
    create_table :dashboard_comments do |t|
      t.integer :article_id
      t.string :name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
