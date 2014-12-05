class Admin::Contact < ActiveRecord::Base
	has_many :reply_contacts
end
