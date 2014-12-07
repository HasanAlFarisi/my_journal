$(".reply-comment-place").append("<%= j(render partial: "dashboard/comments/show_reply", locals: {comment: @reply_comments}) %>")
$(".reply-table").show();
$("#text-reply").remove();