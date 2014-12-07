$(document).ready(function(){
	$("#modal_background").fadeTo(500,5);
	$("#show_modal_comment").html("<%= j(render partial: "admin/company_profiles/show_comment", locals:{comment: @company_comment}) %>")
})