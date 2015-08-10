class Article < ActiveRecord::Base
   has_attached_file :photo,
    #:style => {
 	#thumb: "100x100#", large: '516x310>' },
 	#:url => "/system/:attachment/:id/:style/:basename.:extension",
    	#:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
    	:default_url => "/assets/:style/missing.jpg"
  
validates_attachment_content_type :photo, :content_type => /image/

validates :title, :presence => {:message => "can not be blank"}
validates :body, :presence => {:message => "can not be blank"}
validates :category_id, :presence => {:message => "can not be blank"}

has_many :dasboard_comments
belongs_to :category
belongs_to :admin

	def self.search_by_params(params)
		ar = Article.all
		unless params[:title].blank?
			ar = ar.where("LOWER(title) LIKE '%#{params[:title].downcase}%'")
		end

		unless params[:create_start].blank?
			ar = ar.where("DATE(created_at) BETWEEN '#{params[:create_start]}' AND '#{params[:create_end].blank? ? Date.now : params[:create_end]}'")
		end

		unless params[:category].blank?
			ar = ar.where("category_id = #{params[:category]}")
		end

		unless params[:sub_category].blank?
			ar = ar.where("sub_category_id = #{params[:sub_category]}")
		end

		#unless params[:sort_by].blank?
		#	if params[:sort_by] == 2
		#		ar = ar.joins(:comment).where("comment. = #{params[:sort_by]}")
		#	else

		#	end
		#end

		return ar
	end
end
