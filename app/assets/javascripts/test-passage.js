$(document).ready(function() {
  selectAnswer();
});

var selectAnswer = function () {
  var $nextBtn = $(document).find('.tp-next');
  var $input =  $(document).find('.answer-input');

  $input.on('click', function() {
    $input =  $(document).find('.answer-input');

    if ($input.is(':checked')) {
      $nextBtn.prop('disabled', false)
    }

    else {
      $nextBtn.prop('disabled', true)
    }
  });
};
