class Admin::Gallery < ActiveRecord::Base
	belongs_to :gallery_group
	has_many :gallery_comments, :dependent => :destroy

	accepts_nested_attributes_for :gallery_comments
  
	has_attached_file :photo,
	:style => {
 		thumb: "40x40#", large: '50x50>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
  	:default_url => "/assets/:style/missing.jpg"
  	validates_attachment_content_type :photo, :content_type => /image/

  	def self.save_attributes(id,params)
             unless params[:galleries_attributes].blank?
                  params[:galleries_attributes].each do |image|
                      unless image[1][:id].present?
                        save_photo = self.create({gallery_group_id: id, photo: image[1][:photo], title: image[1][:title], content: image[1][:content]})
                        save_photo.save
                      else
                        save_photo = self.find(image[1][:id]).update(photo: image[1][:photo], title: image[1][:title], content: image[1][:content])
                      end
                    end
             end
  	end
end
