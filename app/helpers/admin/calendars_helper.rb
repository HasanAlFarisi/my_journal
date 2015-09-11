module Admin::CalendarsHelper

	def find_schedule(date)
		schedules = Admin::Schedule.where("DATE(dates) = '#{date}'")
		if schedules.blank?
			date.day
		else
			item = ""
			item += "#{date.day}"
			item += "<br>"
			schedules.limit(2).each do |schedule|
				item += "<p class='schedule'>#{link_to truncate(schedule.title, length:20), admin_calendar_path(schedule.id), remote: true}</p>"
			end
			if schedules.count > 2
				item += "#{link_to 'more...', '#'}"
			end
			item.html_safe
		end
	end
end
