$(".update-profile").click(function(){
	if($("#admin_profile_name").val() == ""){
            notif_error()
            style_error("#admin_profile_name")
            return false
    }else{
    	remove_style_error("#admin_profile_name")
    }

    if($("#admin_profile_last_name").val() == ""){
            notif_error()
            style_error("#admin_profile_last_name")
            return false
    }else{
    	remove_style_error("#admin_profile_name")
    }

    if($("#admin_profile_facebook").val() == ""){
            notif_error()
            style_error("#admin_profile_facebook")
            return false
    }else{
    	remove_style_error("#admin_profile_facebook")
    }

    if($("#admin_profile_e_mail").val() == ""){
            notif_error()
            style_error("#admin_profile_e_mail")
            return false
    }else{
    	remove_style_error("#admin_profile_e_mail")
    }

    if($("#admin_profile_birthday").val() == ""){
            notif_error()
            style_error("#admin_profile_birthday")
            return false
    }else{
    	remove_style_error("#admin_profile_birthday")
    }

    if($("#admin_profile_describe_me").val() == ""){
            notif_error()
            style_error("#admin_profile_describe_me")
            return false
    }else{
    	remove_style_error("#admin_profile_describe_me")
    }

    if($("#admin_profile_motto").val() == ""){
            notif_error()
            style_error("#admin_profile_motto")
            return false
    }else{
    	remove_style_error("#admin_profile_motto")
    }
})

function style_error(classes){
	$(classes).attr("style","background-color:#C21515")
       $(classes).attr("placeholder","Please Fill this FIeld")
}

function remove_style_error (classes) {
	$(classes).attr("style","background-color:#fff")
}

function notif_error(){
        $(".notif-error").html('<span class="styled" id="modal-comment"> <h2><a href="javascript:void(0)" class="close-modal-comment">X</a></h2><div class="formModal" id="formas2" style="padding:20px;color:red">Please Fill All Field Correctly</div></span>')
            $("#modal_background_profile").fadeTo(500, 5);
            $("#modal-comment").fadeIn();
            $( '.close-modal-comment' ).click(function( ev ) {  $( '#modal-comment, #modal_background_profile' ).fadeOut();  ev.preventDefault();} );
}