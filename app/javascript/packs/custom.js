$(document).ready(function(){
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
});
