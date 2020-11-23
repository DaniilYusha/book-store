$(document).ready(() => {
  $(document).on('click', '.alert > .close-flash', function(){
    $(this).parent().remove();
  });
});
