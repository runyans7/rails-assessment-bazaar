$(document).ready(function() {
  var autocomplete_data = JSON.parse($("#username_email").attr("data-autocomplete-source"));
  $( "#username_email" ).autocomplete({
    source: autocomplete_data
  });
});
