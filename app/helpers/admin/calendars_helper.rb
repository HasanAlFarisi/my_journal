module Admin::CalendarsHelper

	def find_schedule(date, current_admin)
		schedules = Admin::Schedule.joins(:schedule_members).where("DATE(dates) = ? AND (admin_schedules.admin_id = ? OR admin_schedule_members.admin_id = ?)", date.to_s, current_admin.id, current_admin.id).group("admin_schedules.id")
		if schedules.blank?
			date.day
		else
			item = ""
			item += "#{date.day}"
			item += "<br>"
			schedules.limit(2).each do |schedule|
				item += "<p class='schedule'>#{link_to truncate(schedule.title, length:20), admin_calendar_path(schedule.id), remote: true}</p>"
			end
			#debugger
			if schedules.map{|x| x.id}.count > 2
				item += "#{link_to 'more...', '#'}"
			end
			item.html_safe
		end
	end

	def find_count_schedule(date, current_admin)
		schedules = Admin::Schedule.joins(:schedule_members).where("EXTRACT(MONTH FROM dates) = ? AND (admin_schedules.admin_id = ? OR admin_schedule_members.admin_id = ?)", Time.now.strftime('%m'), current_admin.id, current_admin.id).group("admin_schedules.id")
		schedules.map{|x| x.id}.count
	end
end
