class Admin::GalleryGroup < ActiveRecord::Base
	has_many :galleries, :dependent => :destroy

	validates :name, :presence => {:message => "can not be blank"}
	
	accepts_nested_attributes_for :galleries
end
