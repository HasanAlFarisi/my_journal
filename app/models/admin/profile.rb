class Admin::Profile < ActiveRecord::Base
	has_attached_file :avatar,
	:style => {
 		thumb: "100x100#", large: '516x310>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
  	:default_url => "/assets/:style/missing.jpg"
  	validates_attachment_content_type :avatar, :content_type => /image/

  	has_many :profile_skills, dependent: :destroy
  	has_many :profile_hobbies, dependent: :destroy
  	belongs_to :admin

  	accepts_nested_attributes_for :profile_skills
  	accepts_nested_attributes_for :profile_hobbies
end
