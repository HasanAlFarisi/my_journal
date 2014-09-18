$( document ).ready(function() {
  var len = 100;
  var p = document.getElementById('truncateMe');
  if (p) {

    var trunc = p.innerHTML;
    if (trunc.length > len) {
      trunc = trunc.substring(0, len);
      trunc = trunc.replace(/\w+$/, '');

      trunc += '<a href="#" ' +
        'onclick="this.parentNode.innerHTML=' +
        'unescape(\''+escape(p.innerHTML)+'\');return false;">' +
        '...<\/a>';
      p.innerHTML = trunc;
    }
  }

  var pTwo = document.getElementById('truncateMeTwo');
  if (pTwo) {

    var trunc = pTwo.innerHTML;
    if (trunc.length > len) {
      trunc = trunc.substring(0, len);
      trunc = trunc.replace(/\w+$/, '');

      trunc += '<a href="#" ' +
        'onclick="this.parentNode.innerHTML=' +
        'unescape(\''+escape(pTwo.innerHTML)+'\');return false;">' +
        '...<\/a>';
      pTwo.innerHTML = trunc;
    }
  }
})