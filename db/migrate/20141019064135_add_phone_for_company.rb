class AddPhoneForCompany < ActiveRecord::Migration
  def change
  	add_column :admin_company_profiles, :phone, :string
  end
end
