$(document).ready(function() {
        if($("#modal_profile").attr("style") != "display: none;"){
            $("#modal_profile").show();
        } 
        $("#modal_profile_full").fadeIn();
        $(".field-dis").attr("style","background-color:#ccc")
        $(".field-dis-blank").attr("style","border:none !important;margin-top:-5px !important")
        if($("#admin_journal_issue_status_id").val() == "11" || $("#admin_journal_issue_status_id").val() == "6"){
                $(".type").hide()
                $(".progress").fadeIn()
        }else{
                $(".type").fadeIn()
                $(".progress").hide()
        }
});

$( '.close-modal-profile' ).click(function( ev ) {  
        $( '#modal_profile, #modal_profile_full, #modal_background' ).fadeOut();  ev.preventDefault();
        $("#modal_profile").remove();
} );
$("#modal_background").click(function(ev){
        $( '#modal_profile, #modal_profile_full, #modal_background' ).fadeOut();  ev.preventDefault();   
})

$("#admin_journal_journal_team_designer_id").change(function(){
    if($(this).val() != ""){
        select_for_developer($(this).val());
    }
})

$("#button-create").click(function(){
    if($("#admin_journal_title").val() == ""){
            notif_error()
            $("#admin_journal_title").attr("style","background-color:#C21515")
            $("#admin_journal_title").attr("placeholder","Please Fill this FIeld")
            return false
    }else{
        remove_style_error("#admin_journal_title")
    }
    if($("#admin-designer").val() == "" || $("#admin_journal_jornal_team_designers_attributes_0_admin_id").val() == ""){
            notif_error()
            $("#admin-designer").attr("style","background-color:#C21515")
            $("#admin_journal_jornal_team_designers_attributes_0_admin_id").attr("style","background-color:#C21515")
            return false
    }else{
        remove_style_error("#admin-designer")
        remove_style_error("#admin_journal_jornal_team_designers_attributes_0_admin_id")
    }
    if($("#admin-developer").val() == "" || $("#admin_journal_journal_team_developers_attributes_0_admin_id").val() == ""){
            notif_error()
            $("#admin-developer").attr("style","background-color:#C21515")
            $("#admin_journal_journal_team_developers_attributes_0_admin_id").attr("style","background-color:#C21515")
            return false
    }else{
        remove_style_error("#admin-developer")
        remove_style_error("#admin_journal_journal_team_developers_attributes_0_admin_id")
    }
    if($("#admin-check").val() == "" || $("#admin_journal_journal_team_checks_attributes_0_admin_id").val() == ""){
            notif_error()
            $("#admin-check").attr("style","background-color:#C21515")
            $("#admin_journal_journal_team_checks_attributes_0_admin_id").attr("style","background-color:#C21515")
            return false
    }else{
        remove_style_error("#admin-check")
        remove_style_error("#admin_journal_journal_team_checks_attributes_0_admin_id")
    }
})

$(".edit-status").click(function(){
    $(".section").fadeIn();
})
$(".edit-close").click(function(){
    $(".section").fadeOut();
})

function remove_style_error (classes) {
    $(classes).attr("style","background-color:#fff")
}

var ids = $(".sub-images").attr("dataId");
var id = $(".sub-screen-shoot").attr("dataId");
$(".add_images").click(function(){
    ids = ids + 1;
    $(".sub-images").append("<span class='parent'><div id='foto_prev_"+ids+"'></div><input class='field size4 input-file floating' id='fileField' name='admin_journal_issue[journal_issue_images_attributes]["+ids+"][image]' onchange='readURLGalleryAppend(this,"+ids+");' type='file'><a href='javascript:void(0)' onclick='javascript:$(this).parent().remove()'><img src='/assets/min.png' /></a><br><br><br></span>")
})

$(".add_files").click(function(){
    ids = ids + 1;
    $(".sub-files").append("<span class='parent'><input class='field size4 input-file floating' id='fileField' name='admin_journal_issue[journal_issue_files_attributes]["+ids+"][file]' type='file'><a href='javascript:void(0)' onclick='javascript:$(this).parent().remove()'><img src='/assets/min.png' /></a><br><br><br></span>")
})

$(".add_screen_shoot").click(function(){
    id = id + 1;
    $(".sub-screen-shoot").append("<span class='parent'><div id='foto_prev_"+id+"'></div><input class='field size4 input-file floating' id='fileFieldAppend' name='admin_help[help_files_attributes]["+id+"][document]' onchange='readURLGalleryAppend(this,"+id+");' type='file'><a href='javascript:void(0)' onclick='javascript:$(this).parent().remove()'><img src='/assets/min.png' /></a><br><br><br></span>")
})

$(".add_photo_gallery").click(function(){
    id = id + 1;
    $(".sub-screen-shoot").append("<div><span class='parent'><label for='admin_gallery_group_galleries_attributes_"+id+"_photo' style='margin-bottom:0px;'>Photo</label><div id='foto_prev_"+id+"'></div></span><input class='field size4 input-file floating' id='fileField' name='admin_gallery_group[galleries_attributes]["+id+"][photo]' onchange='readURLGalleryAppend(this,"+id+");' type='file'><a href='javascript:void(0)' onclick='javascript:$(this).parent().remove()'><img src='/assets/min.png' /></a><div class='cl'>&nbsp;</div><br><label for='admin_gallery_group_galleries_attributes_"+id+"_title'>Title</label><input class='field size4' id='admin_gallery_group_galleries_attributes_"+id+"_title' name='admin_gallery_group[galleries_attributes]["+id+"][title]' type='text'><br><label for='admin_gallery_group_galleries_attributes_"+id+"_content'>Content</label><textarea class='field size1' id='' name='admin_gallery_group[galleries_attributes]["+id+"]][content]' style='height:60px'></textarea><br><br><br></span></div>")
})

$("#admin_journal_issue_status_id").change(function(){
        if($(this).val() == "11" || $(this).val() == "6"){
                $(".type").hide()
                $(".progress").fadeIn()
        }else{
                $(".type").fadeIn()
                $(".progress").hide()
        }
})

function readURLJournalAppend(input,id) {
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function(e){
      $(".img_prev_"+id).remove();
      $(".foto_prev_"+id).append('<img class="img_profile img_prev_'+id+'" src="'+e.target.result+'" width="15%" height="15%"/>');
    };
    reader.readAsDataURL(input.files[0])
  }
}

function readURLGalleryAppend(input, id) {
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function(e){
     $(".img_prev_"+id).remove();
      $("#foto_prev_"+id).append('<img class="img_prev_'+id+'" src="'+e.target.result+'" width="75%"/>');
    };
    reader.readAsDataURL(input.files[0])
  }
}

function notif_error(){
        $(".notif-error").html('<span class="close-error msg msg-error" id="alert"><p>Please Fill All Field Correctly<a href="javascript:void(0)" onclick="javascript:$(this).parent().remove()" class="close"></a></p></span>')
}

function select_for_developer(member){
        var base_address = $(".developer");
        var controller = "/admin/journals/selected_members";
        $.ajax({
            type: "POST",
            url: escape(controller),
            data: {
                "member" : member
            },
            dataType: "html",
            success:function(data){
                jQuery(".developer").html(data);
            }
        })
    }

function select_for_check(member,latest_member){
    var base_address = $(".check");
    var controller = "/admin/journals/selected_checks";
    $.ajax({
        type: "POST",
        url: escape(controller),
        data:{
            "member" : member,
            "latest_member" : latest_member
        },
        dataType: "html",
        success:function(data){
            jQuery(".check").html(data);
        }
    })
}