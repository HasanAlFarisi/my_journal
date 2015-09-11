class Admin::Schedule < ActiveRecord::Base
	has_many :schedule_members, :dependent => :destroy

	accepts_nested_attributes_for :schedule_members

	validates :title, :presence => {:message => "can not be blank"}
	validates :place, :presence => {:message => "can not be blank"}

	def self.get_all(params, current_admin)
		condition = []
		unless params.blank?
		end
		conditions = condition.join(' AND ')
		self.joins(:schedule_members).where(conditions).where("admin_schedules.admin_id = ? OR admin_schedule_members.admin_id = ?", current_admin.id, current_admin.id).group("admin_schedules.id")
	end
end
