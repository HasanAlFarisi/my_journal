$(document).ready(function() {
        $('.masterTooltip').hover(function(){
                var title = $(this).attr('title');
                $(this).data('tipText', title).removeAttr('title');
                $('<p class="tooltip"></p>')
                .html(title)
                .appendTo('body')
                .fadeIn('fast');
        }, function() {
                $(this).attr('title', $(this).data('tipText'));
                $('.tooltip').remove();
        }).mousemove(function(e) {
                var mousex = e.pageX + 20; 
                var mousey = e.pageY + 10; 
                $('.tooltip')
                .css({ top: mousey, left: mousex })
        });
});