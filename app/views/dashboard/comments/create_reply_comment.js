$("#reply-comment-place-<%= params[:comment_id] %>").append("<%= j(render partial: "admin/articles/shared/reply_comment") %>")
$(".sub_comment_for_remove_<%= params[:comment_id] %>").remove();
$(".reply_button_<%= params[:comment_id] %>").show();