$(document).ready(() => {
  let limit = +$('#books_count').val();
  $('.view-more').attr('href', window.location.href);

  $(document).on('click', '.view-more', function(event){
    event.preventDefault();

    let url = $(this).attr('href');
    let current_books_list = $('.books-list');
    limit += limit;

    $.ajax({
      url: url,
      type: 'GET',
      data: {
        'limit': limit
      },
      success: function(data){
        let new_books_list = $(data).find('.books-list');
        $(current_books_list).replaceWith(new_books_list);
      }
    });
  });
});
