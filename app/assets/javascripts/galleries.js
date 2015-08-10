$(document).ready(function(){
	var controller = "/dashboard/galleries";
       $.ajax({
            	type: "GET",
            	url: escape(controller),
            	dataType: "script"
      })
})