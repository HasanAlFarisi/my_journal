function readURLGallery(input) {
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function(e){
     $(".img_prev").remove();
      $(".foto_prev").append('<img class="img_prev" src="'+e.target.result+'" width="500px"/>');
    };
    reader.readAsDataURL(input.files[0])
  }
}