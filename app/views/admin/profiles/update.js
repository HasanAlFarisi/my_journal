$("#form_<%= @tab %>").html("<%= j(render partial:"admin/profiles/details/detail_#{@tab}") %>");	
$(".profile-header").html("<i class='fa fa-user fa-fw'></i><%= @admin_profile.name %> <%= @admin_profile.last_name %>")
$(".admin_full_name").html("<%= @admin_profile.name %> <%= @admin_profile.last_name %>")
$(".admin_name").html("<%= @admin_profile.name %>")
$("#form_<%= @tab %>").removeClass("edit")
$(".fileUpload").addClass("hide");
button_status(<%= @tab %>)

function button_status(tab){
    if($("#form_"+tab+"").hasClass("edit")){
      $(".button_save").removeClass("hide");
      $(".button_edit").addClass("hide");
    }else{
      $(".button_save").addClass("hide");
      $(".button_edit").removeClass("hide");
    }
  }