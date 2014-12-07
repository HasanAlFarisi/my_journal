$(document).ready(function() {
	$("#modal_background").fadeTo(500, 5);
	$("#show_profile_place").html("<%= j(render partial:"admin/profiles/show_profile", locals: {admin_profile: @admin_profile, not_current: @not_current}) %>")
})