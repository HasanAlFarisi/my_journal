<% if @create_like == false %>
	$('#myModal').modal('show');
	$('.modal-title').html("Notification");
	$('.modal-body').html('You have never liked before');
	$('.modal-body').attr("style","background-color:#FFB766")
	$('.modal-save').hide();
<% else %>
	$(".like_count").html("<%= Admin::GalleryLike.find_all_by_gallery_id(params[:gallery_id]).count  %>")
<% end %>