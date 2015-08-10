$("#comment-place").append("<%= j(render partial: "dashboard/comments/show", locals: {dashboard_comment: @dashboard_comment}) %>")
$("#new-comment-place").append("<%= j(render partial: "admin/articles/shared/new_show_comment", locals: {dashboard_comment: @dashboard_comment}) %>")
$("#comment_count").html("<h3><%= params[:comment_count].blank? ? '' : params[:comment_count].to_i + 1 %> Comment(s)</h3>")
$("#ajax_loader").fadeOut();