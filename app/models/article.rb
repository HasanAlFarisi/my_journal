class Article < ActiveRecord::Base
   has_attached_file :photo,
    :style => {
 	thumb: "100x100#", large: '516x310>' },
 	:url => "/system/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
    :default_url => "/assets/:style/missing.jpg"
  
validates_attachment_content_type :photo, :content_type => /image/
<<<<<<< HEAD

validates :title, :presence => {:message => "can not be blank"}
validates :body, :presence => {:message => "can not be blank"}
validates :category_id, :presence => {:message => "can not be blank"}

=======
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
has_many :dasboard_comments
belongs_to :category

	def self.search_by_params(params)
		ar = Article.all
		unless params[:title].blank?
			ar = ar.where("title LIKE '%#{params[:title]}%'")
		end

		unless params[:date].blank?
			ar = ar.where("created_at = #{params[:date]}")
		end

		unless params[:category].blank?
			ar = ar.where("category_id = #{params[:category]}")
		end

		unless params[:sub_category].blank?
			ar = ar.where("sub_category_id = #{params[:sub_category]}")
		end

		return ar
	end
end
