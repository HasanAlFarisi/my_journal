$(document).ready(function() {
	$("#modal_background").fadeTo(500, 5);
	$("#show_modal_comment").html("<%= j(render partial: "admin/articles/show_comment", locals: {comment: @dashboard_comment}) %>")
})