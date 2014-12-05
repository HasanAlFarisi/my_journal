$(document).ready(function(){
	$("#modal_background").fadeTo(500,5)
	$("#show_modal_admin_profile").html("<%= j(render partial: "dashboard/profiles/show_admin_profile", locals: {admin: @admin, admin_comments: @admin_comments}) %>")
})