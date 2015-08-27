$("#myModal").modal("show");
$(".modal-title").html("<%= @calendar.title %> on <%= @calendar.dates.strftime('%d %B %Y') %>")
$(".modal-body").html("<%= j(render partial: "admin/calendars/shared/show") %>")
<% if @calendar.admin_id == current_admin.id %>
	$(".modal-save").show();
	$(".modal-save").removeClass("btn-success");
	$(".modal-save").addClass("btn-primary");
	$(".modal-save").html("<i class='fa fa-pencil'></i> Edit");
<% else %>
	$(".modal-save").hide();
<% end %>

$(".modal-save").click(function(){
	$.ajax({
	        type: "GET",
	        url: "/admin/calendars/<%= @calendar.id %>/edit",
	        dataType:"script"
	    })
})