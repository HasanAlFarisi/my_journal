$(".modal-title").html("Edit <%= @calendar.title %>")
$(".modal-body").html("<%= j(render partial: "admin/calendars/shared/form") %>")
$(".modal-save").removeClass("btn-primary");
$(".modal-save").addClass("btn-success");
$(".modal-save").html("<i class='fa fa-save'></i> Save");