$(".chat-heading").click(function(){
	var id = $(this).attr("dataId")
	if($("#chat-body_"+id).hasClass("nones")){
		$("#chat-body_"+id).removeClass("nones")
		$("#chat-body_"+id).addClass("blocks")
		$("#chat-footer_"+id).removeClass("nones")
		$("#chat-footer_"+id).addClass("blocks")
	}else{
		$("#chat-body_"+id).removeClass("blocks")
		$("#chat-body_"+id).addClass("nones")
		$("#chat-footer_"+id).removeClass("blocks")
		$("#chat-footer_"+id).addClass("nones")
	}
})