$("#comment-place").append("<%= j(render partial: "dashboard/profiles/show_comment_for_admin", locals: {comment: @dashboard_comment}) %>")
$("#ajax_loader").fadeOut();