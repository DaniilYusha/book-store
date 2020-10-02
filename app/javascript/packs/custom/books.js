$(document).on("click", ".view-more", function(event){
  event.preventDefault();

  let url = $(this).children().first().attr('href');
  let view_more_block = $(this).parent();

  $.ajax({
    url: url,
    type: 'GET',
    success: function(data){
      let appended_books = $(data).find('.books-list').children();
      view_more_block.replaceWith(appended_books);
    }
  });
});
