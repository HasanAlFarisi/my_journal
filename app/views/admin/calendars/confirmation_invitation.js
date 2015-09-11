$("#myModal").modal("show");
<% if params[:admin_id].to_i == current_admin.id %>
	$(".modal-title").html("Confirmation Invitation")
	$(".modal-body").html("<%= j(render partial: "admin/calendars/shared/confirmation") %>")
	$(".modal-save").show();
	$(".modal-save").addClass("btn-success");
	$(".modal-save").html("<i class='fa fa-save'></i> Save");
<% else %>
	$(".modal-title").html("<%= j(render partial: "admin/calendars/shared/confirmation_show") %>")
	$(".modal-body").html("<b>Reason : </b><%= @member.reason.blank? ? 'no reason' : @member.reason %>")
	$(".modal-save").hide();
<% end %>
$(".modal-footer").attr("margin-top", "0px")
$(".modal-save").removeClass("btn-primary");

