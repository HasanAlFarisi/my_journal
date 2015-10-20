class Admin::ScheduleMember < ActiveRecord::Base
	belongs_to :schedule

	#after_create :sent_email_schedule

	#def sent_email_schedule
		#AdminMailer.schedule_notification(self).deliver
	#end
end
