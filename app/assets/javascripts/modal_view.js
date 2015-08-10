function view_profile(id,current)
{ 
      var urls = "/admin/profiles/"+id+"?not_current="+current+""
      $.ajax({
        url: urls,
        type:"GET",
      }).done(function(data) {
        $("#view_profile").modal({ show: true });
        $("#view_profile").html(data);
      });
}
function update_journal(id){
  var urls = "/admin/journal_issues/edit_status?id="+id+""
  $.ajax({
    url: urls,
    type: "GET"
  }).done(function(data){
    $("#update_journal").modal({show: true});
    $("#update_journal").html(data);
  });
}
function new_journals(id){
  var urls = "/admin/journal_issues/select_project?admin_id="+id+""
  $.ajax({
    url: urls,
    type: "GET"
  }).done(function(data){
    $("#new_journal").modal({show: true});
    $("#new_journal").html(data);
  })
}
function view_image(id){
  var urls = "/admin/journal_issues/show_task_image?id="+id+""
  $.ajax({
    url: urls,
    type: "GET"
  }).done(function(data){
    $("#view_image").modal({show: true});
    $("#view_image").html(data);
  })
}