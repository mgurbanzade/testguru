$(document).ready(function(){
  $nextBtn = $(document).find('.tp-next');
  $input =  $(document).find('.answer-input');

  $input.click(function(){
    if ($input.is(':checked')) {
      $nextBtn.prop('disabled', false)
    }

    else {
      $nextBtn.prop('disabled', true)
    }
  })
});
