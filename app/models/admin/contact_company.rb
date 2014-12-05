class Admin::ContactCompany < ActiveRecord::Base
	belongs_to :company_profile

	has_many :reply_contact_companies
end
