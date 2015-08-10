class Admin::Journal < ActiveRecord::Base
	has_many :jornal_team_designers, dependent: :destroy
	has_many :journal_team_developers, dependent: :destroy
	has_many :journal_team_checks, dependent: :destroy
	has_many :journal_issues, dependent: :destroy

	accepts_nested_attributes_for :jornal_team_designers
	accepts_nested_attributes_for :journal_team_developers
	accepts_nested_attributes_for :journal_team_checks
	accepts_nested_attributes_for :journal_issues

	validates :title, :presence => {:message => "can not be blank"}
	validates :status_id, :presence => {:message => "can not be blank"}
	validates :project_manajer, :presence => {:message => "can not be blank"}
	validates :start, :presence => {:message => "can not be blank"}
	validates :end, :presence => {:message => "can not be blank"}

	def self.save_attributes(id,journals,type)
		journals.each do |journal|
			if type == 'design'
				unless journal[1][:id].present?
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JornalTeamDesigner.create({journal_id: id, admin_id: journal[1][:admin_id]})
						 #this method for sending message to admin about project who assign
          					AdminMailer.delay(:queue => 'notification_create_journal', :priority => 1).mail_journal("Project Designer",journal[1][:admin_id],id)						
					end
				else
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JornalTeamDesigner.find(journal[1][:id]).update({admin_id: journal[1][:admin_id]})
						AdminMailer.delay(:queue => 'notification_create_journal', :priority => 1).mail_journal("Project Designer",journal[1][:admin_id],id)
					end
				end
			elsif type == 'develop'
				unless journal[1][:id].present?
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamDeveloper.create({journal_id: id, admin_id: journal[1][:admin_id]})
						AdminMailer.delay(:queue => 'notification_create_journal', :priority => 1).mail_journal("Project Developer",journal[1][:admin_id],id)	
					end
				else
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamDeveloper.find(journal[1][:id]).update({admin_id: journal[1][:admin_id]})
						AdminMailer.delay(:queue => 'notification_create_journal', :priority => 1).mail_journal("Project Developer",journal[1][:admin_id],id)
					end
				end
			else
				unless journal[1][:id].present?
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamCheck.create({journal_id: id, admin_id: journal[1][:admin_id]})
						AdminMailer.delay(:queue => 'notification_create_journal', :priority => 1).mail_journal("Project Quality Check",journal[1][:admin_id],id)
					end
				else
					unless journal[1][:admin_id].blank?
						save_journal = Admin::JournalTeamCheck.find(journal[1][:id]).update({admin_id: journal[1][:admin_id]})
						AdminMailer.delay(:queue => 'notification_create_journal', :priority => 1).mail_journal("Project Quality Check",journal[1][:admin_id],id)
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

  	def self.global_join
  		join = "
  			JOIN admin_jornal_team_designers on admin_jornal_team_designers.journal_id = admin_journals.id
  			JOIN admin_journal_team_developers on admin_journal_team_developers.journal_id = admin_journals.id
  			JOIN admin_journal_team_checks on admin_journal_team_checks.journal_id = admin_journals.id
  			LEFT JOIN admin_journal_issues on admin_journal_issues.journal_id = admin_journals.id
  			LEFT JOIN admin_journal_issue_asignees on admin_journal_issue_asignees.journal_issue_id = admin_journal_issues.id
  			"
  		return join
  	end

  	def self.global_conditions(id)
  		condition = []
  		condition << "admin_journals.admin_id = #{id}"
  		condition << "admin_jornal_team_designers.admin_id = #{id}"
  		condition << "admin_journal_team_developers.admin_id = #{id}"
  		condition << "admin_journal_team_checks.admin_id = #{id}"
  		condition << "admin_journal_issue_asignees.admin_id = #{id}"
  		conditions = condition.join(" OR ")

  		return conditions
  	end

  	def self.is_allowed(id,status_id)
  		join_table = global_join
  		conditions = global_conditions(id)
  		unless status_id == nil
  			status_condition = "admin_journals.status_id = #{status_id} AND"  			
  			select_all = self.joins("{{join_table}}".gsub("{{join_table}}", join_table)).where("#{status_condition} ({{conditions}})".gsub("{{conditions}}", conditions)).group("admin_journals.id")
  		else
  			select_all = self.joins("{{join_table}}".gsub("{{join_table}}", join_table)).where("{{conditions}}".gsub("{{conditions}}", conditions)).group("admin_journals.id")
  		end
  		

  		return select_all
  	end

  	def self.search_by_params(id,params)
  		join_table = global_join
  		conditions = global_conditions(id)
  		filter_condition = []
  		unless params[:title].blank?
  			filter_condition << "AND LOWER(admin_journals.title) LIKE '%#{params[:title]}%'"
  		end

  		unless params[:status].blank?
  			filter_condition << "AND admin_journals.status_id = #{params[:status]}"
  		end

  		unless params[:create_start].blank?
  			filter_condition << "AND DATE(admin_journals.created_at) BETWEEN #{params[:create_start].blank? ? Date.today : params[:create_start]} AND #{params[:create_end].blank? ? Date.today : params[:create_end]}"	
  		end

  		filter_conditions = filter_condition.join(" AND ")

  		select_all = self.joins("{{join_table}}".gsub("{{join_table}}", join_table)).where("({{conditions}}) {{filter}}".gsub("{{conditions}}", conditions).gsub("{{filter}}", filter_conditions)).group("admin_journals.id")
  		return select_all
  	end

  	def self.find_filter(current_admin,id, params)
  		Admin::JournalIssue.data_existed_index_filter(current_admin,id,params)
  	end
end
