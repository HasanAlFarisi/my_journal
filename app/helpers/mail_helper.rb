module MailHelper
	 def find_profile(admin_id)
		Admin::Profile.find_by_admin_id(admin_id)
	end

	def find_type(type_id)
		Admin::TypeJournal.find(type_id).name
	end

	def find_priority(priority)
		index = priority - 1
		priority = ['Urgent', 'Hight', 'Normal']
		number = priority[index]
		return number
	end

	def find_status(status_id)
		if status_id == 1
			generated(1)
		elsif status_id == 2
			generated(2)
		elsif status_id == 3
			generated(3)
		elsif status_id == 4
			generated(4)
		elsif status_id == 5	
			generated(5)
		elsif status_id == 6 || status_id == 11
			generated(6)
		end				
	end

	def generated_status(status_id)
		if status_id == 1
			generated_image(1)
		elsif status_id == 2
			generated_image(2)
		elsif status_id == 3
			generated_image(3)
		elsif status_id == 4
			generated_image(4)
		elsif status_id == 5	
			generated_image(5)
		elsif status_id == 6 || status_id == 11
			generated_image(6)
		end				
	end

	def generated_status_navbar(status_id)
		if status_id == 1
			generated_image_list(1)
		elsif status_id == 2
			generated_image_list(2)
		elsif status_id == 3
			generated_image_list(3)
		elsif status_id == 4
			generated_image_list(4)
		elsif status_id == 5	
			generated_image_list(5)
		elsif status_id == 6 || status_id == 11
			generated_image_list(6)
		end				
	end

	def generated_image_list(id)
		status = Admin::StatusJournal.find(id)
		count = Admin::JournalIssue.status_count(current_admin,id)
		image = ""
		image += "<li>"
		image += "<a href = /admin/journal_issues/#{id}/list_data_by_status>"
		image += "<b class='label label-#{id}'>#{count}</b>&nbsp;"
		image += "<span style='#{@select}'>#{status.name}</span>"
		image += "</a>"
		image += "</li>"
		return image
	end

	def generated_image(id)
		status = Admin::StatusJournal.find(id)
		image = ""
		image += "<a href = /admin/journal_issues/#{id}/list_data_by_status>"
		image += "<span class='notif_#{id}' style='#{@select}'>#{status.name}</span>"
		image += "</a>"
		return image
	end

	def generated(id)
		id = id -1
		array = ['New','Feedback','Rejected','Resolved','Close','In Progress']
		html = ""
		html += "[ #{array[id]} ]"
		return html
	end
end