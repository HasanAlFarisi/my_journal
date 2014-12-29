$(document).ready(function(){
	$("#submit-form").click(function(){
		($('#gallery_comment_name').val().length == 0) ? $('#error_name').html("<i style='color: red;'>Please fill this Name field</i>") : $('#error_name p').remove();
		($('#textarea-label').val().length == 0) ? $('#error_body').html("<i style='color: red;'>Please fill this Comment content</i>") : $('#error_body p').remove();

		if($('#gallery_comment_name').val().length > 0 && $('#textarea-label').val().length > 0){
		
			$("#ajax_loader").fadeIn();
			$.ajax({
				type: "POST",
				url: "/dashboard/galleries/"+$('#gallery_comment_gallery_id').val()+"/comment",
				data:{
					'gallery_comment[gallery_id]' : $('#gallery_comment_gallery_id').val(),
					'gallery_comment[name]' : $('#gallery_comment_name').val(),
					'gallery_comment[email]' : $('#gallery_comment_email').val(),
					'gallery_comment[body]' : $('#textarea-label').val()
				},
				dataType: "script",
				success: "data"
			});
		}
	})
})