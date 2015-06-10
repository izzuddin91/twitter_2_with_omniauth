$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#crawl-tweets").click(function(event){
    event.preventDefault();
    $('#loading_img').show();
    $.ajax({
      type: "POST",
      url: "/username",
      data: $("#find-tweets").serialize(),
      cache: false,
      success: function(response){
        $("#status").html(response);
        $('#loading_img').hide();
      },
      error: function(){
        $("#status").html("</br>Request failed, please make sure to input a valid Twitter handle.");
        $('#loading_img').hide();
      }
    });
  });
});
