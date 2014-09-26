function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.img_prev').remove();
      $('.img-data').hide();
      $('.foto_prev').append('<img class="img_prev img-data" src="'+e.target.result+'" style="width:420px; height:200px;"/>');
      $('.foto_prev_profile').append('<img class="img_profile floating img_prev" src="'+e.target.result+'" />');
    };
    reader.readAsDataURL(input.files[0]);
  }
}

function readIconURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.icon_prev').remove();
      $('.icon_img_prev').append('<img class="floating img-icon icon_prev" src="'+e.target.result+'" />');
    };
    reader.readAsDataURL(input.files[0]);
  }
}