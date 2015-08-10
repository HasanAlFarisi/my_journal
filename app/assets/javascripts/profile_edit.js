function edit_form(id){
    $(".fileUpload").removeClass("hide");
    tabs(id);
    $.ajax({
      url:"/admin/profiles/"+id+"/edit?tab="+tab+"",
      type:"GET",
    }).done(function(data) {
      $("#form_"+tab+"").html(data);
      $("#form_"+tab+"").addClass("edit")
      button_status(tab,id)
    });
  }

  /*function save_form (ids,tab) {
    var controller = "/admin/profiles/"+ids
    $.ajax({
        type: "PATCH",
        url: escape(controller),
        data: {
            "admin_profile[name]" : $("#admin_profile_name").val(),
            "admin_profile[last_name]" : $("#admin_profile_last_name").val(),
            "admin_profile[facebook]" : $("#admin_profile_facebook").val(),
            "admin_profile[e_mail]" : $("#admin_profile_e_mail ").val(),
            "tab" : tab
        },
        dataType: "html",
        success:function(data){
            $("#form_"+tab+"").html(data)
            $("#form_"+tab+"").removeClass("edit")
            button_status(tab,ids)
        }
    })
  }*/

  function tabs(id){
    if($("#profile-pills").hasClass("active")){
      tab = $("#profile-pills").attr("dataId")
      button_status(tab,id)
    }else if($("#home-pills").hasClass("active")){
      tab = $("#home-pills").attr("dataId")
      button_status(tab,id)
    }else if($("#messages-pills").hasClass("active")){
      tab = $("#messages-pills").attr("dataId")
      button_status(tab,id)
    }else if($("#settings-pills").hasClass("active")){
      tab = $("#settings-pills").attr("dataId")
      button_status(tab,id)
    }else{
      tab = $("#motto-pills").attr("dataId")
      button_status(tab,id)
    }
  }

  function button_status(tab,id){
    if($("#form_"+tab+"").hasClass("edit")){
      /*$(".edited").attr("onclick","save_form("+id+","+tab+")")
      $(".edited").removeClass("btn-primary")
      $(".edited").addClass("btn-success")
      $(".edited").text("Save")*/
      $(".button_save").removeClass("hide");
      $(".button_edit").addClass("hide");
    }else{
      $(".button_save").addClass("hide");
      $(".button_edit").removeClass("hide");
      /*$(".edited").attr("onclick","edit_form("+id+")")
      $(".edited").removeClass("btn-success")
      $(".edited").addClass("btn-primary")
      $(".edited").text("Edit")*/
    }
  }

  $(".home-pills").click(function(){
    ids = $(".nav-pills").attr("userId")
    button_status(1,ids)
  })
  $(".profile-pills").click(function(){
    ids = $(".nav-pills").attr("userId")
    button_status(2,ids)
  })
  $(".messages-pills").click(function(){
    ids = $(".nav-pills").attr("userId")
    button_status(3,ids)
  })
  $(".settings-pills").click(function(){
    ids = $(".nav-pills").attr("userId")
    button_status(4,ids)
  })
  $(".motto-pills").click(function(){
    ids = $(".nav-pills").attr("userId")
    button_status(5,ids)
  })

function add_field (a) {
  i = a +"111";
     $(".sub-skill").append("<span class='parent'><p><input  class='form-control floating' style='width:40% !important; margin:0px 5px 5px 0px' id='admin_profile_profile_skills_attributes_"+i+"_name' name='admin_profile[profile_skills_attributes]["+i+"][name]' type='text'><input class='form-control floating' style='width:40% !important' id='admin_profile_profile_skills_attributes_"+i+"_skill' name='admin_profile[profile_skills_attributes]["+i+"][skill]' type='text'></p><div style='margin-top:-7px' class='floating'>%</div><a href='javascript:void(0)' onclick='javascript:$(this).parent().remove()'><img src='/assets/min.png' style='margin-top:-10px' /></a><p><span class='clearfix'></span></p></span>");
     $(".sub").attr("onclick", "add_field("+i+")");
}

function add_field_hobbies(a){
  b = a +"111";
   $(".sub-hobby").append("<span class='parent'><input class='form-control floating' id='admin_profile_profile_hobbies_attributes_"+b+"_name' name='admin_profile[profile_hobbies_attributes]["+b+"][name]' type='text'  style='width:85% !important;'><a href='javascript:void(0)' onclick='javascript:$(this).parent().remove()'><img src='/assets/min.png' /></a><br><br></span>");
    $(".subs").attr("onclick", "add_field_hobbies("+b+")");
}