$(document).ready(function() {
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
});