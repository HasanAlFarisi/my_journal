$(".show_calendar").click(function(){
	id = $(this).attr("dataId");
	url = "/admin/calendars/"+id+""
	$.ajax({
		type: "GET",
		url: url,
		dataType: "script"
	})
})

$(".edit_calendar").click(function(){
	id = $(this).attr("dataId");
	$.ajax({
	        type: "GET",
	        url: "/admin/calendars/"+id+"/edit",
	        dataType:"script"
	    })
})

$(".confirmation_invitation").click(function(){
	schedule_id = $(this).attr("dataSchedule");
	admin_id = $(this).attr("dataId");
	$.ajax({
		type: "GET",
		url: "/admin/calendars/confirmation_invitation",
		data:{
			"schedule_id" : schedule_id,
			"admin_id" : admin_id
		},
		dataType: "script"
	})
})