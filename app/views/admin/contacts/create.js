$("#comment-place-admin").append("<%= j(render partial: "dashboard/profiles/show_comment_for_admin", locals:{comment: @comment}) %>");
$("#ajax_loader").fadeOut();
