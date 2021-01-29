$(document).ready(() => {
  $(document).on('click', '.checkbox-input[name="use_billing_address"]', function(){
    $('.col-md-5.col-md-offset-1.mb-60 > .form-group-valid').toggle('slow');
  });
});
