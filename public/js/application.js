$(document).ready(function() {
  $(".tweet_form").submit(function(event){
    event.preventDefault();
    $('#loading_img').show();
    $(this).children("input").disabled;
    $.ajax({
      type: "POST",
      url: "/tweet",
      data: $(".tweet_form").serialize(),
      cache: false,
      success: function(response){
        $("#status").html("All good. Tweet successfully sent!");
        $('#loading_img').hide();
        $(this).children("input").removeAttr("disabled");
      },
      error: function(){
        $("#status").html("Tweet did not get sent successfully. Please retry.");
        $('#loading_img').hide();
      }
    });
  });
});
