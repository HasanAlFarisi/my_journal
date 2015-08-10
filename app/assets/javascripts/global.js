$(function() {
    $('#search_dashboard').submit(function() {
        JournalIS.shoWait();
        return true; // return false to cancel form action
    });

    $('#subscribe_btn').click(function(){
    	//JournalIS.shoWait();
    	$('#myModal').modal('show');
    	return true;
    })
});