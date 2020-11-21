$(document).ready(() => {
  $(document).on('click', '.read-more', function(event){
    event.preventDefault();

    toggle_book_description($(this), $(this).attr('for'), $(this).next().attr('for'));
  });

  $(document).on('click', '.read-less', function(event){
    event.preventDefault();

    toggle_book_description($(this), $(this).attr('for'), $(this).prev().attr('for'));
  });

  function toggle_book_description(element, clicked_element_role, opposit_role){
    $(`.${opposit_role}-description`).toggle();
    $(element).toggle();
    $(`.${clicked_element_role}-description`).toggle();
    $(`.read-${opposit_role}`).toggle();
  }
});
