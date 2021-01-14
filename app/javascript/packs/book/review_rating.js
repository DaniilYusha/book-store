$(document).ready(() => {
  $(document).on('mouseover', '#stars > svg', function(){
    let rating_value = +$(this).data('value');
    let stars = $(this).parent().children('svg');

    stars.each(function(index){
      if(index < rating_value){
        $(this).removeClass('rate-empty');
      }
    });
  });

  $(document).on('mouseout', '#stars', function(){
    $(this).children('svg').each(function(){
      if(!$(this).hasClass('selected-star')){
        $(this).addClass('rate-empty');
      }
    });
  });

  $(document).on('click', '#stars > .rate-star', function(){
    let rating_value = +$(this).data('value');
    let stars = $(this).parent().children('svg');

    stars.each(function(index){
      $(this).removeClass('selected-star')

      index < rating_value ? $(this).addClass('selected-star') : $(this).addClass('rate-empty')
    });

    $('#review_rating').val(rating_value);
  });
});
