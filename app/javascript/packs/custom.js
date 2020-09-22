$(document).ready(function(){
  $(".read-more").on("click", function(event){
    event.preventDefault();

    $(".short-description").toggle();
    $(this).toggle();
    $(".more-description").toggle(600);
    $(".read-less").toggle();
  });

  $(".read-less").on("click", function(event){
    event.preventDefault();

    $(".more-description").toggle(600);
    $(this).toggle();
    $(".short-description").toggle();
    $(".read-more").toggle();
  });
});
