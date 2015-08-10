$(".get_index").html("<%= j(render partial: "admin/journals/get_index") %>")
$("#ajax_loader").fadeOut();
$(".ajaxs").addClass("hide");
$(".body_index").removeClass("hide");
$(".shows").html("<%= @admin_journals_status_filter.count %>")
$(".froms").html("<%= @admin_journals_status_filter_all.count %>")
$(".assign").html("<%= @assign.blank? ? 'All' : find_profile(@assign).name %>'s Journal(s)")
$('.masterTooltip').hover(function(){
        var title = $(this).attr('title');
        $(this).data('tipText', title).removeAttr('title');
        $('<p class="tooltips"></p>')
        .html(title)
        .appendTo('body')
        .fadeIn('fast');
}, function() {
        $(this).attr('title', $(this).data('tipText'));
        $('.tooltips').remove();
}).mousemove(function(e) {
        var mousex = e.pageX + 20; 
        var mousey = e.pageY + 10; 
        $('.tooltips')
        .css({ top: mousey, left: mousex })
});