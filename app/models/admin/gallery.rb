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

  	def self.save_attributes(id,params)
             unless params[:galleries_attributes].blank?
                  params[:galleries_attributes].each do |image|
                      unless image[1][:id].present?
                        save_photo = self.create({gallery_group_id: id, photo: image[1][:photo], title: image[1][:title], content: image[1][:content]})
                        save_photo.save
                        preloaded = Cloudinary::Uploader.upload(image[1][:photo], :use_filename => true, :public_id => "galleries/#{save_photo.id}", :transformation => [{:width => 650, :crop => :limit}])
                      else
                        save_photo = self.find(image[1][:id]).update(photo: image[1][:photo], title: image[1][:title], content: image[1][:content])
                        loaded = Cloudinary::Uploader.destroy("galleries/#{image[1][:id]}", :public_id => "galleries/#{image[1][:id]}", :invalidate => true)
                        reloaded = Cloudinary::Uploader.upload(image[1][:photo], :use_filename => true, :public_id => "galleries/#{image[1][:id]}", :transformation => [{:width => 650, :crop => :limit}])
                      end
                    end
             end
  	end
end
