module Admin::CompanyProfilesHelper
	def find_company_comment(id)
		Admin::ContactCompany.where("admin_id = ?",id).all
	end
end
