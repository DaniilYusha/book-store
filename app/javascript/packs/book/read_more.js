$(document).ready(() => {
  $(document).on('click', '.read-more', function(event){
    event.preventDefault();

    toggle_book_description($(this), $(this).next().attr('for'));
  });

  $(document).on('click', '.read-less', function(event){
    event.preventDefault();

    toggle_book_description($(this), $(this).prev().attr('for'));
  });

  function toggle_book_description(element, opposit_role){
    $(`.${opposit_role}-description`).toggle();
    $(element).toggle();
    $(`.${element.attr('for')}-description`).toggle();
    $(`.read-${opposit_role}`).toggle();
  }
});
