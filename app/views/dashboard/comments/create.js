$("#comment-place").append("<%= j(render partial: "dashboard/comments/show", locals: {dashboard_comment: @dashboard_comment}) %>")
$("#ajax_loader").fadeOut();