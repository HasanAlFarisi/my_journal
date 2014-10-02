class Admin::GalleryGroup < ActiveRecord::Base
	has_many :galleries, :dependent => :destroy

	accepts_nested_attributes_for :galleries
end
