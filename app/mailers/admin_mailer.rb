class AdminMailer < ActionMailer::Base
<<<<<<< HEAD
  include MailHelper
  helper :mail

  default from: "no-reply@heroku.com"

  def mail_notice(profile,name,email,body)
  	company = Admin::CompanyProfile.last.name
  	
=======
  default from: "admin@my-journal.heroku.com"

  def mail_notice(name,email,body)
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
  	@name = name
  	@email = email
  	@body = body
  	
<<<<<<< HEAD
  	mail(to: profile, subject: "#{company} Notification")
  end

  def notification_for_all_admins(params,admin)
  	@company = Admin::CompanyProfile.last.name

  	@name = params[:name]
  	@email = params[:email]
  	@body = params[:body]
  	@admin = Admin::Profile.find_by_admin_id(admin.id)

  	mail(to: admin.email, subject: "#{@company} Notification")
  end

  def mail_journal(type,admin_id,journal_id)
      @type = type
      @company = Admin::CompanyProfile.last.name
      @journal = Admin::Journal.find(journal_id)
      @admin = find_profile(admin_id)
     
      mail(to: @admin.e_mail, subject: "#{@company} Notification")
  end

  def mail_journal_issue(journal_issue,admin_id,type)
      @type = type
      @company = Admin::CompanyProfile.last.name
      @journal_issue = Admin::JournalIssue.find(journal_issue)
      @journal = Admin::Journal.find(@journal_issue.journal_id)
      @admin = find_profile(admin_id)

      mail(to: @admin.e_mail, subject: "#{@company} Notification")
=======
  	mail(to: "hasan.alfarisi@wgs.co.id", subject: "Notification Contact")
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
  end
end
