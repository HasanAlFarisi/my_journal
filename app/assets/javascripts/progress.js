var JournalIS = { 
  waitProgress: function(defwidth){
    defwidth 	= defwidth || 60;
    $parent 	= parseInt($("#progress-parent").css("width"));
    $progress = parseInt($("#wait-progress").css("width"));
    $width 		= parseInt(($progress/$parent)*100) + defwidth;
    $("#wait-progress").width($width + "%");
  },
  
  shoWait: function(){
  	$('#waitDialog').modal({
		  backdrop: 'static',
		  keyboard: false
		});
    setInterval(this.waitProgress, 100);
  },
  
  resetWait: function(timeout){
    timeout = timeout || true;
    if(timeout){
      setTimeout(function(){
        $("#waitDialog").modal("hide");
      }, 1250);
    }else{
      $("#waitDialog").modal("hide");     
    }
    $("#wait-progress").width("0%");
  }
}