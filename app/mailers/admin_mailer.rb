class AdminMailer < ActionMailer::Base
  default from: "admin@my-journal.heroku.com"

  def mail_notice(name,email,body)
  	@name = name
  	@email = email
  	@body = body
  	
  	mail(to: "hasan.alfarisi@wgs.co.id", subject: "Notification Contact")
  end
end
