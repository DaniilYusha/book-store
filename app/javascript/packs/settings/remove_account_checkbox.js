$(document).ready(() => {
  $(document).on('click', '.checkbox-input', function(){
    $('.remove-account').toggleClass('disabled');

    $(this).is(':checked') ? $('.remove-account').removeAttr('disabled') : $('.remove-account').attr('disabled', true)
  });
});
