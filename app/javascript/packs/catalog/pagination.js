$(document).ready(() => {
  $(document).on('click', '.view-more', function(event){
    event.preventDefault();

    let url = window.location.href;
    let current_books_list = $('.books-list');
    let current_books_count = $('#books_count').val();

    $.ajax({
      url: url,
      type: 'GET',
      data: {
        'current_books_count': current_books_count
      },
      success: function(data){
        let new_books_list = $(data).find('.books-list');
        $(current_books_list).replaceWith(new_books_list);
      }
    });
  });
});
