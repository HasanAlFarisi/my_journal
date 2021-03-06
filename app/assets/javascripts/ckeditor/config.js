$( document ).ready(function() {
  $('.ckeditor').ckeditor({
    toolbar: [
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
    { name: 'insert', items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar'
             ,'Iframe' ] }, 
    { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat','Underline' ] },
    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
    { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
    { name: 'tools', items : [ 'Maximize','-','About' ] }
    ]
  });

  $('.mini_ckeditor').ckeditor({
    toolbar: [
      { name: 'clipboard', items : ['Copy','Paste']},
      { name: 'insert', items: ['Smiley']},
      { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline'] }
    ]
  });
})