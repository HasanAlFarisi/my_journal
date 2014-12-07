$(".reply-comment-place").append("<%= j(render partial: "admin/contacts/show_reply", locals: {comment: @reply_contact, reply_contact: 'yes'}) %>")
$(".reply-table").show();
$("#text-reply").remove();