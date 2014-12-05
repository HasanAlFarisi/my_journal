$(".reply-comment-place").append("<%= j(render partial: "admin/contacts/show_reply", locals: {comment: @reply_contact, reply_contact: 'no'}) %>")
$("#count_reply_<%= @reply_contact.contact_id %>").html("<center><%= @reply_contacts.count %></center>")
$(".reply-table").show();
$("#text-reply").remove();