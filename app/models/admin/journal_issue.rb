class Admin::JournalIssue < ActiveRecord::Base
	belongs_to :journal
	has_many :journal_issue_asignees, dependent: :destroy
	has_many :journal_issue_images, dependent: :destroy
	has_many :journal_issue_files, dependent: :destroy
	has_many :journal_issue_comments, dependent: :destroy
	accepts_nested_attributes_for :journal_issue_asignees
	accepts_nested_attributes_for :journal_issue_images
	accepts_nested_attributes_for :journal_issue_files
	accepts_nested_attributes_for :journal_issue_comments

	validates :status_id, :presence => {:message => "can not be blank"}
	validates :priority, :presence => {:message => "can not be blank"}
	validates :asignee, :presence => {:message => "can not be blank"}
	validates :title, :presence => {:message => "can not be blank"}

	def self.data_existed(current_admin,type)
		join_table = "
			JOIN admin_journal_issue_asignees on admin_journal_issue_asignees.journal_issue_id = admin_journal_issues.id
			JOIN admin_journals on admin_journals.id = admin_journal_issues.journal_id
			"
		global_group = self.global_group()
		condition = []
		condition << "admin_journal_issues.status_id IS NOT NULL"
		condition << "no IS NOT NULL" 
		condition << "admin_journal_issues.title IS NOT NULL"
		if type == "main"
			condition << "(asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id})"
			condition << "admin_journal_issues.status_id != 5"
		else
			condition << "(asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id})"
		end
		conditions = condition.join(" AND ")
		self.joins("{{joins}}".gsub("{{joins}}",join_table)).where("{{conditions}}".gsub("{{conditions}}",conditions.to_s)).group("{{global_group}}".gsub("{{global_group}}",global_group))#group("admin_journal_issue_asignees.journal_issue_id")
	end

	def self.data_existed_count(current_admin,type)
		join_table = "
			JOIN admin_journals on admin_journals.id = admin_journal_issues.journal_id
			JOIN admin_journal_issue_asignees on admin_journal_issue_asignees.journal_issue_id = admin_journal_issues.id
			"
		condition = []
		condition << "admin_journal_issues.status_id IS NOT NULL"
		condition << "no IS NOT NULL" 
		condition << "admin_journal_issues.title IS NOT NULL"
		if type == "main"
			condition << "(asignee = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id})"
			condition << "admin_journal_issues.status_id != 5"
		else
			condition << "(asignee = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id})"
		end
		conditions = condition.join(" AND ")
		self.joins("{{joins}}".gsub("{{joins}}",join_table)).where("{{conditions}}".gsub("{{conditions}}",conditions.to_s))
	end

	def self.get_data_status(current_admin,id)
		join_table = self.global_joins()
		conditions = self.conditions_where(current_admin,nil,id)
		self.joins("{{joins}}".gsub("{{joins}}",join_table)).where("{{conditions}}".gsub("{{conditions}}", conditions.to_s))
	end

	def self.status_count(current_admin,id)
		join_table = self.global_joins()
		condition = []
		condition << self.conditions_where(current_admin,nil,id)
		condition << "admin_journal_issues.status_id = #{id}"
		conditions = condition.join(" AND ")
		self.where("{{conditions}}".gsub("{{conditions}}",conditions.to_s)).joins("{{join_table}}".gsub("{{join_table}}", join_table)).count
	end

	def self.data_existed_index(current_admin,type)
		join_table = self.global_joins()
		global_group = self.global_group()
		conditions = self.conditions_where(current_admin,"search",type)
		
		self.joins("{{joins}}".gsub("{{joins}}",join_table)).where("{{conditions}}".gsub("{{conditions}}",conditions.to_s)).group("{{global_group}}".gsub("{{global_group}}",global_group))
	end

	def self.data_existed_index_filter(current_admin,ids,params)
		join_table = self.global_joins()
		global_group = self.global_group()
		conditions = self.conditions_where_filter(current_admin,ids,params)

		unless ids.blank?
			self.joins("{{joins}}".gsub("{{joins}}",join_table)).where("{{conditions}}".gsub("{{conditions}}",conditions.to_s))
		else
			self.joins("{{joins}}".gsub("{{joins}}",join_table)).where("{{conditions}}".gsub("{{conditions}}",conditions.to_s)).group("{{global_group}}".gsub("{{global_group}}",global_group))
		end
	end

	def self.global_joins()
		join ="
			LEFT JOIN admin_journal_issue_asignees on admin_journal_issue_asignees.journal_issue_id = admin_journal_issues.id
			LEFT JOIN admin_journals on admin_journals.id = admin_journal_issues.journal_id
			"
		return join
	end

	def self.global_group()
		group = "
			admin_journal_issue_asignees.journal_issue_id, admin_journal_issues.id
		"
		return group
	end

	def self.conditions_where(current_admin,journal_id,type)
		condition = []
		condition << "admin_journal_issues.status_id IS NOT NULL"
		condition << "no IS NOT NULL" 
		condition << "admin_journal_issues.title IS NOT NULL"
		if type == "main"
			condition << "(admin_journal_issues.asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id} OR admin_journal_issues.from = #{current_admin.id})"
			unless journal_id == "search"
				condition << "admin_journal_issues.status_id != 5"	
			end
		elsif type == "index"
			condition << "admin_journal_issues.status_id != 5"
			condition << "(asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id})"	
		elsif type == "notif"
			condition << "admin_journal_issues.status_id != 5"
			condition << "(asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id})"	
			condition << "admin_journal_issues.notif_status = false"
		else
			condition << "(admin_journal_issues.asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id} OR admin_journal_issues.from = #{current_admin.id})"
			condition << "admin_journal_issues.status_id = #{type}"
		end
		
		if journal_id.present? && journal_id != "search"
			condition << "admin_journal_issues.journal_id = #{journal_id}"
		end
		conditions = condition.join(" AND ")
		return conditions
	end

	def self.conditions_where_filter(current_admin, ids, params)
		condition = []
		condition << "admin_journal_issues.status_id IS NOT NULL"
		condition << "no IS NOT NULL" 
		condition << "admin_journal_issues.title IS NOT NULL"
		condition << "(admin_journal_issues.asignee = #{current_admin.id} OR admin_journal_issue_asignees.admin_id = #{current_admin.id} OR admin_journals.admin_id = #{current_admin.id} OR admin_journal_issues.from = #{current_admin.id})"
		unless params[:no].blank?
			condition << "admin_journal_issues.no = '#{params[:no]}'"
		end
		unless params[:project].blank?
			condition << "admin_journal_issues.journal_id = #{params[:project]}"
		end
		unless params[:status].blank?
			condition << "admin_journal_issues.status_id = #{params[:status]}"
		end
		unless params[:priority].blank?
			condition << "admin_journal_issues.priority = #{params[:priority]}"
		end
		unless params[:progress_start].blank? || params[:progress_end].blank?
			condition << "admin_journal_issues.progress BETWEEN #{params[:progress_start].to_i} AND #{params[:progress_end].to_i}"
		end
		unless params[:title].blank?
			condition << "(LOWER(admin_journal_issues.title) LIKE '%#{params[:title]}%')"
		end
		unless params[:assign].blank?
			condition << "(admin_journal_issues.asignee = #{params[:assign]})"
		end
		unless ids.blank?
			condition << "admin_journals.id IN #{ids}"
		end
		conditions = condition.join(" AND ")
		return conditions
	end

	def self.generated_number_issue
		data = self.last.blank? ? 0 :  self.last.no
	    	number = data.to_i + 1
	    	return number.to_s.rjust(6, '0')
	end

	def self.assign(id)
		select = "
			admin_profiles.name AS name,
			admin_profiles.last_name AS last_name,
			admin_profiles.admin_id AS admin_id"
		join_table = "
  			JOIN admin_jornal_team_designers on admin_jornal_team_designers.journal_id = admin_journals.id
  			JOIN admin_journal_team_developers on admin_journal_team_developers.journal_id = admin_journals.id
  			JOIN admin_journal_team_checks on admin_journal_team_checks.journal_id = admin_journals.id
  			JOIN admin_profiles on admin_profiles.admin_id = admin_jornal_team_designers.admin_id 
  			OR admin_profiles.admin_id = admin_journal_team_developers.admin_id
  			OR admin_profiles.admin_id = admin_journal_team_checks.admin_id
  			OR admin_profiles.admin_id = admin_journals.admin_id
  			"
		conditions = []
		conditions << "admin_journals.id = #{id}"
		conditions << "admin_jornal_team_designers.journal_id = #{id}"
		conditions << "admin_journal_team_developers.journal_id = #{id}"
		conditions << "admin_journal_team_checks.journal_id = #{id}"
		condition = conditions.join(" AND ")
		select_all = Admin::Journal.select("{{select}}".gsub("{{select}}",select)).where("{{condition}}".gsub("{{condition}}",condition)).joins("{{joins}}".gsub("{{joins}}",join_table)).group("admin_profiles.admin_id, admin_profiles.name, admin_profiles.last_name, admin_profiles.admin_id")
	end

	def self.assign_notice(id)
		admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(id,nil)
		 ids_all = []
		 admin_journals.each do |journal|
		 	ids_all << journal.id
		 end
		 convert_all = convert_to_arr_for_query(ids_all)
		 present = Admin::JournalIssue.find_index_count(convert_all == ")" ? "(0)" : convert_all,id,'main')
		 admin_journals_status = present
		 return admin_journals_status
	end

	def self.convert_to_arr_for_query(ids_param)
		key_string = "("
		ids_param.each do |x|
			key_string << "#{x},"
		end
		key_string[key_string.length-1] = ")"
		key_string
	  end

	def self.save_attributes(id,params)
		unless params[:admin_journal_issue][:journal_issue_asignees_attributes].blank?
			params[:admin_journal_issue][:journal_issue_asignees_attributes].each do |assign|
				unless assign[1][:id].present?
					save_issue = Admin::JournalIssueAsignee.create({journal_issue_id: id, admin_id: assign[1][:admin_id]})
					save_issue.save
					AdminMailer.delay(:queue => 'notification_create_journal_issue', :priority => 1).mail_journal_issue(id,assign[1][:admin_id],"plus")
				else
					begin
					save_issue = Admin::JournalIssueAsignee.find(assign[1][:id])
					rescue;end
					unless save_issue.blank?
						save_issue.update({admin_id: assign[1][:admin_id]})
						AdminMailer.delay(:queue => 'notification_create_journal_issue', :priority => 1).mail_journal_issue(id,assign[1][:admin_id],"plus")
					end
				end
			end
		end

		unless params[:admin_journal_issue][:journal_issue_files_attributes].blank?
			params[:admin_journal_issue][:journal_issue_files_attributes].each do |file|
				unless file[1][:id].present?
					save_issue = Admin::JournalIssueFile.create({journal_issue_id: id, document: file[1][:file]})
					save_issue.save
					preloaded = Cloudinary::Uploader.upload(file[1][:file], :public_id => "journal_issue/files/#{save_issue.id}_#{save_issue.document_file_name}",:resource_type => :auto)
				else
					save_issue = Admin::JournalIssueFile.find(file[1][:id]).update({document: file[1][:file]})
					loaded = Cloudinary::Uploader.destroy("journal_issue/files/#{save_issue.id}_#{save_issue.document_file_name}", :public_id => "journal_issue/files/#{save_issue.id}_#{save_issue.document_file_name}", :invalidate => true)
					preloaded = Cloudinary::Uploader.upload(file[1][:file], :public_id => "journal_issue/files/#{save_issue.id}_#{save_issue.document_file_name}",:resource_type => :auto)
				end
			end
		end

		unless params[:admin_journal_issue][:journal_issue_images_attributes].blank?
			params[:admin_journal_issue][:journal_issue_images_attributes].each do |image|
				unless image[1][:id].present?
					save_issue = Admin::JournalIssueImage.create({journal_issue_id: id, image: image[1][:image]})
					save_issue.save
					preloaded = Cloudinary::Uploader.upload(image[1][:image], :use_filename => true, :public_id => "journal_issue/images/#{save_issue.id}")
				else
					save_issue = Admin::JournalIssueImage.find(image[1][:id]).update({image: image[1][:image]})
					 loaded = Cloudinary::Uploader.destroy("journal_issue/images/#{image[1][:id]}", :public_id => "journal_issue/files/#{image[1][:id]}", :invalidate => true)
					preloaded = Cloudinary::Uploader.upload(image[1][:image], :use_filename => true, :public_id => "journal_issue/images/#{image[1][:id]}")
				end
			end
		end
	end

	def self.find_index_count(ids,current_admin,type)
		join_table = self.global_joins()
		condition = []
		condition << "admin_journal_issues.journal_id IN #{ids}"
		if type == "search"
			condition << "(admin_journal_issues.asignee = #{current_admin} OR admin_journals.admin_id = #{current_admin} OR admin_journal_issue_asignees.admin_id = #{current_admin})"
		elsif type == "main"
			condition << "(admin_journal_issues.asignee = #{current_admin} OR admin_journal_issue_asignees.admin_id = #{current_admin} OR admin_journal_issues.from = #{current_admin} OR admin_journals.admin_id = #{current_admin})"
		else
			condition << "(admin_journal_issues.asignee = #{current_admin} OR admin_journal_issue_asignees.admin_id = #{current_admin})"
			condition << "admin_journal_issues.status_id != 5"
		end
		conditions = condition.join(" AND ")

		journal_issue = self.joins("{{join_table}}".gsub("{{join_table}}",join_table)).where("{{conditions}}".gsub("{{conditions}}", conditions))

		return journal_issue
	end

	def self.find_index_count_notif(ids,current_admin,type)
		join_table = self.global_joins()
		condition = []
		condition << "admin_journal_issues.journal_id IN #{ids}"
		condition << "(admin_journal_issues.asignee = #{current_admin} OR admin_journal_issue_asignees.admin_id = #{current_admin})"
		condition << "admin_journal_issues.status_id != 5"
		condition << "admin_journal_issues.notif_status = false"
		conditions = condition.join(" AND ")

		journal_issue = self.joins("{{join_table}}".gsub("{{join_table}}",join_table)).where("{{conditions}}".gsub("{{conditions}}", conditions))

		return journal_issue
	end
end
