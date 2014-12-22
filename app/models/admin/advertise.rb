class Admin::Advertise < ActiveRecord::Base
	has_attached_file :image,
    	:style => {
 	thumb: "100x100#", large: '516x310>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
    	:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
    	:default_url => "/assets/:style/banner_125x125.jpg"
  
	validates_attachment_content_type :image, :content_type => /image/

	attr_accessor :on_status_true

	validate :check_count, :if => :on_status_true

	def check_count
		advertise = Admin::Advertise.where("status = true").count
		if advertise >= 4
			errors.add(:status, "showing can't more than 4 Advertise")
		end
	end
end
