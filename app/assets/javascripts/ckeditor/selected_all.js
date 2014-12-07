$(document).ready(function(){
  $(".check-all").click(function(){
    if($(this).is(':checked')) {
      $(".check-self").attr("checked","checked")
    }else{
      $(".check-self").removeAttr("checked")
    }
  });
})