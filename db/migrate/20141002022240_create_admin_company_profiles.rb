class CreateAdminCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :admin_company_profiles do |t|
      t.string :name
      t.string :address
      t.string :vission
      t.string :mission
      t.string :motto
      t.attachment :photo

      t.timestamps
    end
  end
end
