$("#new-reply-comment-place-<%= j(params[:id]) %>").html("<%= j(render partial: "admin/articles/shared/form_reply_comment") %>");
$(".reply_button_<%= params[:id] %>").hide();