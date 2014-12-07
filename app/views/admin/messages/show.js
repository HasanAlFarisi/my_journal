$("#modal_background").fadeTo(500, 5);
$("#show_modal_message").html("<%= j(render partial: "admin/articles/show_comment", locals: {comment: @message_admin, reply_contact: 'no'}) %>")
$("#read_status_<%= @message_admin.id %>").html("<img src='/assets/read.png' class='ico_message'>")