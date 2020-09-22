$(document).ready(function(){
  $(".read-more").on("click", function(event){
    event.preventDefault();

    $(".short-description").toggle();
    $(".more-description").toggle(600, function(){
      $(this).is(":visible") ? $(".read-more").text("Hide") : $(".read-more").text("Read more")
    });
  })
});
