class Admin::ProfileSkill < ActiveRecord::Base
	has_attached_file :icon,
	:style => {
 		thumb: "40x40#", large: '50x50>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
  	:default_url => "/assets/:style/missing.jpg"
  	validates_attachment_content_type :icon, :content_type => /image/

	belongs_to :profile
end
