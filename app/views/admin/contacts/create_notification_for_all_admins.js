$("#comment-place").append("<%= j(render partial: "dashboard/company_comments/show", locals: {dashboard_comment: @company_comments}) %>")
$("#ajax_loader").fadeOut();