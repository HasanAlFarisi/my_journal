$(document).ready(function() {
	$("#modal_background").fadeTo(500, 5);
<<<<<<< HEAD
	$("#show_modal_comment").html("<%= j(render partial: "admin/articles/show_comment", locals: {comment: @dashboard_comment, reply_contact: 'yes'}) %>")
=======
	$("#show_modal_comment").html("<%= j(render partial: "admin/articles/show_comment", locals: {comment: @dashboard_comment}) %>")
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
})