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
        hide_view_more()
      }
    });
  });

  function hide_view_more(){
    let category_id = +$('#books_count').data('category-id');
    let books_count = $('#books_count').val();
    let books_in_category = +$(`[data-category-id=${category_id}]`).children('span').text();

    if(isNaN(category_id) && books_count == books_in_category) {
      $('.view-more').hide();
    }
    else if(Number.isInteger(category_id) && books_count == books_in_category) {
      $('.view-more').hide();
    }
  }
});
