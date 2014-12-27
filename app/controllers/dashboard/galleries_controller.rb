class Dashboard::GalleriesController < ApplicationController
	before_filter :prepare_session

	def index
		session[:url_back_dashboard] = request.original_url
		@galleries = Admin::GalleryGroup.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
	end

	def show
		@gallery = Admin::GalleryGroup.find(params[:id])
		@gallery_photos = Admin::Gallery.where("gallery_group_id = ?", params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
	end

	def show_photo
		@gallery_photo = Admin::Gallery.find(params[:gallery_id])
		@comments = Admin::GalleryComment.where("gallery_id = ?", params[:gallery_id])
	end

	def comment
		@dashboard_comment = Admin::GalleryComment.new(gallery_comment_params)
		@dashboard_comment.save
	end

	def prepare_session
		session[:current] = "gallery"
	end

	private
	def gallery_comment_params
		params.require(:gallery_comment).permit(:gallery_id, :name, :email, :body)
	end
end
