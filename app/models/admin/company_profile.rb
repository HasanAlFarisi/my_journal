class Admin::CompanyProfile < ActiveRecord::Base
	has_attached_file :photo,
	:style => {
 		thumb: "40x40#", large: '50x50>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
  	:default_url => "/assets/:style/missing.jpg"
  	validates_attachment_content_type :photo, :content_type => /image/
<<<<<<< HEAD

  	has_many :contact_companies

      validates :name, :presence => {:message => "can not be blank"}
      validates :address, :presence => {:message => "can not be blank"}
      validates :vission, :presence => {:message => "can not be blank"}
      validates :mission, :presence => {:message => "can not be blank"}
=======
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
end
