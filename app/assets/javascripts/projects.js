function copyText() {
  var textToCopy = $("#username_email").val();
  var existingText = $("#collaborator_list").val();
  if ($("#collaborator_list").val() == "") {
    $("#collaborator_list").val(textToCopy);
  } else {
    $("#collaborator_list").val(existingText + ', ' + textToCopy);
  }
}

$(document).ready(function() {
  var autocomplete_data = JSON.parse($("#username_email").attr("data"));
  $( "#username_email" ).autocomplete({
    source: autocomplete_data
  });

  $("#add_to_list").on("click", function(){
    copyText();
    $("#username_email").val("");
  })
});
