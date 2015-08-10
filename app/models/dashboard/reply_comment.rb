class Dashboard::ReplyComment < ActiveRecord::Base
	belongs_to :comment
	belongs_to :admin
end
