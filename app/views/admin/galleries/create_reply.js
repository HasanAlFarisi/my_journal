$(".comment_place").append("<%= j(render partial: "admin/galleries/show_reply") %>")
$(".comment_count").html("<%= Admin::GalleryComment.find_all_by_gallery_id(params[:gallery_id]).count  %>")