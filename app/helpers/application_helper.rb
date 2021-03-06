module ApplicationHelper

	def count_message(admin)
		Admin::Contact.where("admin_id = ? AND read_status = false", admin.id).count
	end

	def find_name(current_admin)
		admin = Admin::Profile.find_by_admin_id(current_admin)
		admin_name = "#{admin.name} #{admin.last_name}"
		return admin_name
	end

	def find_profile(admin_id)
		Admin::Profile.find_by_admin_id(admin_id)
	end

	def find_admin(admin_id)
		Admin.find(admin_id)
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

	def find_journal_in_issue(journal_id)
		return Admin::Journal.find(journal_id)
	end

	def find_reply_gallery(gallery)
		return Admin::GalleryCommentReply.where("gallery_comment_id = ?", gallery.id)
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

	#def generated_status(status_id)
	#	if status_id == 1
	#		generated_image(1)
	#	elsif status_id == 2
	#		generated_image(2)
	#	elsif status_id == 3
	#		generated_image(3)
	#	elsif status_id == 4
	#		generated_image(4)
	#	elsif status_id == 5	
	#		generated_image(5)
	#	elsif status_id == 6 || status_id == 11
	#		generated_image(6)
	#	end				
	#end

	def generated_count_per_status(id)
		Admin::JournalIssue.status_count(current_admin,id)
	end

	#def generated_image(id)
	#	status = Admin::StatusJournal.find(id)
	#	count = Admin::JournalIssue.status_count(current_admin,id)
	#	image = ""
	#	image += "<li>"
	#	image += "<a href = /admin/journal_issues/#{id}/list_data_by_status>"
	#	image += "<span class='notif_#{id}' style='#{@select}'>#{status.name}</span>"
	#	image += "&nbsp;<b class='label label-#{id}'>#{count}</b>"
	#	image += "</a>"
	#	image += "</li>"
	#	return image
	#end

	def generated(id)
		id = id -1
		array = ['New','Feedback','Rejected','Resolved','Close','In Progress']
		html = ""
		html += "[ #{array[id]} ]"
		return html
	end

	def generated_file_type(file)
		images = ""
		images += "<span class='floating add-margin-right'>"
		if !['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'image/jpeg', 'image/png', 'image/bmp', 'application/x-rar'].include?(file.document_content_type)
			images += "<img class='image_name' src='/assets///image_unknow.png'>"
		else
			images += "<img class='image_name' src='/assets///image_#{File.extname(file.document_file_name)}.png'>"
		end
		images += "<span class='clearfix'></span>"
		images += "<span class='file_name'>#{truncate(file.document_file_name.sub('/', ''), :length => 15)}</span>"
		images += "</span>"
		return images
	end

	def generated_priority(priority)
		if priority == 1
			status = "Urgent"
		elsif priority == 2
			status = "Hight"
		elsif priority == 3
			status = "Normal"
		end	
		return status
	end

	def generated_link_to(name_link,path_link,options=nil,attribute = nil)  
	    	link=""
	    	link = link_to(raw(name_link), "#{path_link}",options).html_safe
	    	return link
	end
end
