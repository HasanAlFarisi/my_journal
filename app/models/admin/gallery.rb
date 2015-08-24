require "delayed_job"

class Admin::Gallery < ActiveRecord::Base
	has_many :gallery_comments, :dependent => :destroy

	accepts_nested_attributes_for :gallery_comments
	
	has_attached_file :photo,
	:style => {
		thumb: "40x40#", large: '50x50>' },
	:url => "/system/:attachment/:id/:style/:basename.:extension",
		:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
		:default_url => "/assets/:style/missing.jpg"
		validates_attachment_content_type :photo, :content_type => /image/

	def self.admin_gallery_attributes(params)
		params.each do |sub_attribute|
			attribute = self.new
			attribute.title = sub_attribute[1][:title]
			attribute.content = sub_attribute[1][:content]
			attribute.photo = sub_attribute[1][:photo]
			if attribute.save
				unless sub_attribute[1][:photo].blank?
					Cloudinary::Uploader.upload(sub_attribute[1][:photo], :use_filename => true, :public_id => "galleries/#{attribute.id}", :transformation => [{:width => 600, :crop => :limit}])
				end
			end
		end
	end
end
