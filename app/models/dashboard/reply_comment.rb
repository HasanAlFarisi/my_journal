class Dashboard::ReplyComment < ActiveRecord::Base
	belongs_to :comment
end
