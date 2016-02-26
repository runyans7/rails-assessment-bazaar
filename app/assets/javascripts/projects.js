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
  $( "#username_email" ).autocomplete({
    source: $("#username_email").data("emails")
  });

  $("#add_to_list").on("click", function() {
    copyText();
    $("#username_email").val("");
  });

  $("#task-toggle").click(function() {
    $("div#add-task").toggle();
  });
});
