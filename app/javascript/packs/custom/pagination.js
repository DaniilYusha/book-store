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
        hide_view_more()
      }
    });
  });

  function hide_view_more(){
    let category_id = +$('#books_count').data('category-id');
    let rendered_books = +$('#books_count').val();
    let all_books = +$('#all_books').text();
    let books_in_category = +$(`[data-category-id=${category_id}]`).children('span').text();

    if(isNaN(category_id) && rendered_books >= all_books) {
      $('.view-more').hide();
    }
    else if(Number.isInteger(category_id) && rendered_books >= books_in_category) {
      $('.view-more').hide();
    }
  }
});
