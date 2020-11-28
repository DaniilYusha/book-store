$(document).ready(() => {
  let MIN_QUANTITY = 1;

  $(document).on('click', '#plus', function(event){
    event.preventDefault();

    quantity = +$('.quantity-input').val();
    $('.quantity-input').val(++quantity);
  });

  $(document).on('click', '#minus', function(event){
    event.preventDefault();

    quantity = +$('.quantity-input').val();

    if(quantity > MIN_QUANTITY) {
      $('.quantity-input').val(--quantity);
    }
  });
});
