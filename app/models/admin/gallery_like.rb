class Admin::GalleryLike < ActiveRecord::Base
	belongs_to :gallery

	def self.create_like(params)
		condition = self.where("current_ip = ? AND gallery_id = ?", params[:current_ip], params[:gallery_id])
		if condition.blank?
			like = self.new
			like.gallery_id = params[:gallery_id]
			like.current_ip = params[:current_ip]
			like.save
		else
			condition = false
		end
	end
end
