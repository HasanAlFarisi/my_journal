function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.img_prev').remove();
      $('.img-data').hide();
      $('.foto_prev').append('<img class="img_prev img-data company-logo" src="'+e.target.result+'" style="width:420px; height:200px;"/>');
<<<<<<< HEAD
    };
    reader.readAsDataURL(input.files[0]);
  }
}

function readURLProfile(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.img_prev_profile').remove();
      $('.foto_prev_profile').append('<img class="img_profile floating img_prev_profile" src="'+e.target.result+'" />');
=======
      $('.foto_prev_profile').append('<img class="img_profile floating img_prev" src="'+e.target.result+'" />');
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
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
<<<<<<< HEAD
}

function readURLJournal (input) {
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function(e){
      $('.img_prev').remove();
      $('.foto_prev').append('<span><img class="img_profile img_prev" src="'+e.target.result+'" width="10%" height="10%"/><a href="javascript:void(0)" onclick="javascript:$(this).parent().remove()" class="close">Cencel</a></span>');
    };
    reader.readAsDataURL(input.files[0])
  }
=======
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
}