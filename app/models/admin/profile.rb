class Admin::Profile < ActiveRecord::Base
	has_attached_file :avatar,
	:style => {
 		thumb: "100x100#", large: '516x310>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
  	:default_url => "/assets/:style/missing.jpg"
  	validates_attachment_content_type :avatar, :content_type => /image/
end
