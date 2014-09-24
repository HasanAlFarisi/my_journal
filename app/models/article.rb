class Article < ActiveRecord::Base
   has_attached_file :photo,
    :style => {
 	thumb: "100x100#", large: '516x310>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
    :default_url => "/assets/:style/missing.jpg"
  
validates_attachment_content_type :photo, :content_type => /image/
has_many :dasboard_comments
belongs_to :category

end
