class Dashboard::Comment < ActiveRecord::Base
	belongs_to :article

	has_many :reply_comments
end
