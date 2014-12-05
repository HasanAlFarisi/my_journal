class Admin::Journal < ActiveRecord::Base
	has_many :jornal_team_designers, dependent: :destroy
	has_many :journal_team_developers, dependent: :destroy
	has_many :journal_team_checks, dependent: :destroy
	has_many :journal_issues, dependent: :destroy

	accepts_nested_attributes_for :jornal_team_designers
	accepts_nested_attributes_for :journal_team_developers
	accepts_nested_attributes_for :journal_team_checks
	accepts_nested_attributes_for :journal_issues

	def self.save_attributes(id,journals,type)
		journals.each do |journal|
			if type == 'design'
				unless journal[1][:id].present?
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JornalTeamDesigner.create({journal_id: id, admin_id: journal[1][:admin_id]})
						 #this method for sending message to admin about project who assign
          					AdminMailer.mail_journal("Project Designer",journal[1][:admin_id],id).deliver	
					end
				else
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JornalTeamDesigner.find(journal[1][:id]).update({admin_id: journal[1][:admin_id]})
						AdminMailer.mail_journal("Project Designer",journal[1][:admin_id],id).deliver	
					end
				end
			elsif type == 'develop'
				unless journal[1][:id].present?
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamDeveloper.create({journal_id: id, admin_id: journal[1][:admin_id]})
						AdminMailer.mail_journal("Project Developer",journal[1][:admin_id],id).deliver	
					end
				else
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamDeveloper.find(journal[1][:id]).update({admin_id: journal[1][:admin_id]})
						AdminMailer.mail_journal("Project Developer",journal[1][:admin_id],id).deliver
					end
				end
			else
				unless journal[1][:id].present?
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamCheck.create({journal_id: id, admin_id: journal[1][:admin_id]})
						AdminMailer.mail_journal("Project Quality Check",journal[1][:admin_id],id).deliver	
					end
				else
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamCheck.find(journal[1][:id]).update({admin_id: journal[1][:admin_id]})
						AdminMailer.mail_journal("Project Quality Check",journal[1][:admin_id],id).deliver
					end
				end
			end	
			unless journal[1][:id].present? || journal[1][:admin_id].blank?
				save_journal.save
			end
		end
	end

	def self.generated_number(id)
		temp = Temp.create(source_id: id)
		temp.save
		data = temp.blank? ? 0 : temp.id
		number = data.to_i + 1
		return number.to_s.rjust(1, '0')
  	end

  	def self.is_allowed(id,status_id)
  		join_table = "
  			JOIN admin_jornal_team_designers on admin_jornal_team_designers.journal_id = admin_journals.id
  			JOIN admin_journal_team_developers on admin_journal_team_developers.journal_id = admin_journals.id
  			JOIN admin_journal_team_checks on admin_journal_team_checks.journal_id = admin_journals.id
  			LEFT JOIN admin_journal_issues on admin_journal_issues.journal_id = admin_journals.id
  			LEFT JOIN admin_journal_issue_asignees on admin_journal_issue_asignees.journal_issue_id = admin_journal_issues.id
  			"
  		condition = []
  		condition << "admin_journals.admin_id = #{id}"
  		condition << "admin_jornal_team_designers.admin_id = #{id}"
  		condition << "admin_journal_team_developers.admin_id = #{id}"
  		condition << "admin_journal_team_checks.admin_id = #{id}"
  		condition << "admin_journal_issue_asignees.admin_id = #{id}"
  		conditions = condition.join(" OR ")
  		unless status_id == nil
  			status_condition = "admin_journals.status_id = #{status_id} AND"  			
  			select_all = self.joins("{{join_table}}".gsub("{{join_table}}", join_table)).where("#{status_condition} ({{conditions}})".gsub("{{conditions}}", conditions)).group("admin_journals.id")
  		else
  			select_all = self.joins("{{join_table}}".gsub("{{join_table}}", join_table)).where("{{conditions}}".gsub("{{conditions}}", conditions)).group("admin_journals.id")
  		end
  		

  		return select_all
  	end
end
