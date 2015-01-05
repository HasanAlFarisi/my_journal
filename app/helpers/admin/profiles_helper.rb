module Admin::ProfilesHelper
	def loaded_rand(type,id)
		random = RandCloud.where("types = ? AND type_id = ?", type, id).shift
		unless random.blank?
			return random.rand
		end
	end
end
