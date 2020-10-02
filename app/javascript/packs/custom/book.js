$(document).on("click", ".read-more", function(event){
  event.preventDefault();

  $(".short-description").toggle();
  $(this).toggle();
  $(".more-description").toggle();
  $(".read-less").toggle();
});

$(document).on("click", ".read-less", function(event){
  event.preventDefault();

  $(".more-description").toggle(600);
  $(this).toggle();
  $(".short-description").toggle();
  $(".read-more").toggle();
});
