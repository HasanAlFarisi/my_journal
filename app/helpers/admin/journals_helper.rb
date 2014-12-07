module Admin::JournalsHelper
	def estimated_time(end_time)
		return end_time - Date.today
	end

	def estimated_time_progress(start_time,end_time)
		
	end

	def estimated_asignee(journal_id)
		manager = Admin::Journal.where("id = ?", journal_id).count
		designer = Admin::JornalTeamDesigner.where("journal_id = ?", journal_id).count
		developer = Admin::JournalTeamDeveloper.where("journal_id = ?", journal_id).count
		check = Admin::JournalTeamCheck.where("journal_id = ?", journal_id).count
		counts = manager + designer + developer + check
		return counts
	end

	def estimated_asignee_list(journal_id)
		manager = Admin::Journal.find(journal_id)
		designers = Admin::JornalTeamDesigner.where("journal_id = ?", journal_id)
		developers = Admin::JournalTeamDeveloper.where("journal_id = ?", journal_id)
		checks = Admin::JournalTeamCheck.where("journal_id = ?", journal_id)
		asignee = ""
		asignee += "<b>As Project Manager</b>"
		asignee += "</br>"
		asignee += "#{manager.project_manajer}"
		asignee += "</br></br>"
		asignee += "<b>As Project Designer</b>"
		asignee += "</br>"
		designers.each do |designer|
			asignee += "#{find_name(designer.admin_id)}"
			asignee += "</br>"
		end
		asignee += "</br>"
		asignee += "<b>As Project Developer</b>"
		asignee += "</br>"
		developers.each do |developer|
			asignee += "#{find_name(developer.admin_id)}"
			asignee += "</br>"
		end
		asignee += "</br>"
		asignee += "<b>As Project Check</b>"
		asignee += "</br>"
		checks.each do |check|
			asignee += "#{find_name(check.admin_id)}"
			asignee += "</br>"
		end

		return asignee
	end
end
