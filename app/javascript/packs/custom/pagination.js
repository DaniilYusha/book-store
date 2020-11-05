$(document).ready(() => {
  $(document).on('click', '.view-more', function(event){
    event.preventDefault();

    let limit = +$('#books_count').val();
    let url = window.location.href;
    let current_books_list = $('.books-list');
    limit += +$('#books_count').data('per-page');

    $.ajax({
      url: url,
      type: 'GET',
      data: {
        'limit': limit
      },
      success: function(data){
        let new_books_list = $(data).find('.books-list');
        $(current_books_list).replaceWith(new_books_list);
        $('#books_count').val(limit);
        if(+$('#books_count').val() > $('.book').length){
          $('.view-more').hide();
        }
      }
    });
  });
});
