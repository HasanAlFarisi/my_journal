$(".ajax").click(function(){
      $("#ajax_loader").fadeIn();
      $(".ajaxs").removeClass("hide");
      $(".body_index").addClass("hide");
})

$("#project").change(function(){
	/*var controller = "/admin/journals/get_assign"
	var project = $(this).val()
     $.ajax({
          type: "POST",
          url: escape(controller),
          data: {"category" : project
        },
          dataType:"html",
          success:function(data){
            jQuery(".sub_category_sidebar").html(data);
          }
      })*/
	//category_selected_sidebar()
})

function category_selected_sidebar(){
    var base_address = $(".sub_category_sidebar");
      var controller = "<%= auto_search_sidebar_admin_articles_path %>";
      $.ajax({
          type: "POST",
          url: escape(controller),
          data: {"category" : $('#project').val()     
        },
          dataType:"html",
          success:function(data){
            jQuery(".sub_category_sidebar").html(data);
          }
      })
  }