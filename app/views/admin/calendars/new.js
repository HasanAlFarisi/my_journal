$("#myModal").modal("show");
$(".modal-title").html("Add to the schedule on <%= params[:date] %>")
$(".modal-body").html("<%= j(render partial: "admin/calendars/shared/form") %>")