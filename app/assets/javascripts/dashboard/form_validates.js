$(document).ready(function(){
	$("#submit-form").click(function(){
		($('#dashboard_comment_name').val().length == 0) ? $('#error_name').html("<p><i style='color: red;'>Please fill this Name field</i></p>") : $('#error_name p').remove();
		($('#textarea-label').val().length == 0) ? $('#error_body').html("<p><i style='color: red;'>Please fill this Comment content</i></p>") : $('#error_body p').remove();
		
		if($("#submit-form").attr("dataId") == "contact_for_admin"){
			var  form_url = "/admin/contacts"	   	
<<<<<<< HEAD
		}else if($("#submit-form").attr("dataId") == "contact_for_all_admins"){
			var form_url = "/admin/contacts/1/create_notification_for_all_admins"
		}
		else{
=======
		}else{
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
		   	var  form_url = "/dashboard/comments"
		}

		if($('#dashboard_comment_name').val().length > 0 && $('#textarea-label').val().length > 0){
<<<<<<< HEAD
			$("#ajax_loader").fadeIn();
=======
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
			$.ajax({
			type: "POST",
			url: form_url,
			data:{
<<<<<<< HEAD
					'profile_email' : $("#submit-form").attr("profileEmail"),
					'dashboard_comment[article_id]' : $('#dashboard_comment_article_id').val(),
					'dashboard_comment[admin_id]' : $('#dashboard_comment_admin_id').val(),
=======
					'dashboard_comment[article_id]' : $('#dashboard_comment_article_id').val(),
					'dashboard_comment[admin_id]' : $('#dashboard_comment_article_id').val(),
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
					'dashboard_comment[name]' : $('#dashboard_comment_name').val(),
					'dashboard_comment[email]' : $('#dashboard_comment_email').val(),
					'dashboard_comment[body]' : $('#textarea-label').val(),
					'dashboard_comment[profile]' : $('#dashboard_comment_profile').val()
			 },
			 dataType: "script",
			 success: "data"
			});
		}
	})
})