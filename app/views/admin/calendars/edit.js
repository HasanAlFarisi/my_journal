$("#myModal").modal("show");
$(".modal-title").html("Edit to the schedule on <%= params[:date].blank? ? @calendar.dates.strftime('%m %B %y') : params[:date] %>")
$(".modal-body").html("<%= j(render partial: "admin/calendars/shared/form") %>")