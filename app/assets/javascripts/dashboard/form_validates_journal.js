$(".button-check").click(function(){
    if($("#admin_journal_issue_asignee").val() == ""){
        $(".error_assigned").html("<i style='color:red'>Cannot be Blank!</i>")
        error("#admin_journal_issue_asignee")
        return false
    }else{
        $(".error_assigned").html("")
    }

    if($("#admin_journal_issue_status_id").val() == ""){
        $(".error_status").html("<i style='color:red'>Cannot be Blank!</i>")
        error("#admin_journal_issue_status_id")
        return false
    }else{
        $(".error_status").html("")
    }

    if($("#admin_journal_issue_type_id").val() == ""){
        $(".error_type").html("<i style='color:red'>Cannot be Blank!</i>")
        error("#admin_journal_issue_type_id")
        return false
    }else{
        $(".error_type").html("")
    }
})

function error(id){
  $(id).attr("style", "border:red 1px solid")
}