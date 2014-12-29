class Admin::GalleryComment < ActiveRecord::Base
	belongs_to :gallery

	has_many :gallery_comment_replies, :dependent => :destroy

	accepts_nested_attributes_for :gallery_comment_replies
end
