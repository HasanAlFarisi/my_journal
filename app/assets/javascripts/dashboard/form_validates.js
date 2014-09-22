$(document).ready(function(){
	$("#submit-form").click(function(){
		($('#dashboard_comment_name').val().length == 0) ? $('#error_name').html("<p><i style='color: red;'>Please fill this Name field</i></p>") : $('#error_name p').remove();
		($('#textarea-label').val().length == 0) ? $('#error_body').html("<p><i style='color: red;'>Please fill this Comment content</i></p>") : $('#error_body p').remove();

		if($('#dashboard_comment_name').val().length > 0 && $('#textarea-label').val().length > 0){
			$.ajax({
			 type: "POST",
			 url: "/dashboard/comments",
			 data:{
					'dashboard_comment[article_id]' : $('#dashboard_comment_article_id').val(),
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