class Dashboard::Comment < ActiveRecord::Base
	belongs_to :article
end
