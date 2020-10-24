$(document).on("click", ".checkbox-input", function(){
  if($(this).is(':checked')) {
    $('.remove-account').removeClass('disabled').attr('disabled', false).addClass('btn-default');
    return;
  }
  $('.remove-account').removeClass('btn-defaul').attr('disabled', true).addClass('disabled');
});
