function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.img_prev').remove();
      $('.img-data').hide();
      $('.foto_prev').append('<img class="img_prev img-data" src="'+e.target.result+'" style="width:420px; height:200px;"/>');
    };
    reader.readAsDataURL(input.files[0]);
  }
}