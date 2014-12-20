$( document ).ready(function() {
  $('.ellipsis').truncate({
    width: 'auto',
    token: '&hellip;',
    side: 'right',
    addclass: false,
    addtitle: true,
  });
  $('.ellipsisTwo').truncate({
    width: 'auto',
    token: '&hellip;',
    side: 'right',
    addclass: false,
    addtitle: true,
  });
})
;
