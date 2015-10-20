class Admin::Schedule < ActiveRecord::Base
	has_many :schedule_members, :dependent => :destroy

	accepts_nested_attributes_for :schedule_members

	validates :title, :presence => {:message => "can not be blank"}
	validates :place, :presence => {:message => "can not be blank"}

	def self.get_all(params, current_admin)
		condition = []
		unless params.blank?
			unless params[:title].blank?
				condition << "LOWER(admin_schedules.title) LIKE '%#{params[:title].downcase}%'"
			end
			unless params[:place].blank?
				condition << "LOWER(admin_schedules.place) LIKE '%#{params[:place].downcase}%'"
			end
			unless params[:date_filter].blank?
				condition << "admin_schedules.dates = '#{params[:date_filter]}'"
			end
			unless params[:time_start].blank?
				condition << "admin_schedules.start_time = '#{params[:time_start]}'"
			end
			unless params[:time_end].blank?
				condition << "admin_schedules.end_time = '#{params[:time_end]}'"
			end
		end
		conditions = condition.join(' AND ')
		self.joins(:schedule_members).where(conditions).where("admin_schedules.admin_id = ? OR admin_schedule_members.admin_id = ?", current_admin.id, current_admin.id).group("admin_schedules.id")
	end
end
