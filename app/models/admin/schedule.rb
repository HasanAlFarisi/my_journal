class Admin::Schedule < ActiveRecord::Base
	has_many :schedule_members, :dependent => :destroy

	accepts_nested_attributes_for :schedule_members

	validates :title, :presence => {:message => "can not be blank"}
	validates :place, :presence => {:message => "can not be blank"}
end
