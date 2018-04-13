$(document).ready(function() {
  var $form = $(document).find('.js-test_passage');
  var $timer = $(document).find('.timer');
  var timeLimit = $form.data('timer');
  var resultPath = window.location.href + '/result';

  var timer = function() {
    sessionStorage.setItem('initLimit', timeLimit);

    $timer.html(getMinutes(timeLimit));
    $timer.css('color', 'green');

    if (performance.navigation.type == 1) {
      sessionSecs = sessionStorage.getItem('seconds');
      initLimit = sessionStorage.getItem('initLimit');

      if (sessionSecs > 0) {
        timeLimit = sessionStorage.getItem('seconds');
        $timer.html(getMinutes(timeLimit));
      }

      else {
        timeLimit = initLimit;
        $timer.html(getMinutes(timeLimit));
      }
    }
  };

  var timeUpdate = setInterval(function() {
    if (timeLimit > 0) {
      var seconds = timeLimit -= 1;
      sessionStorage.setItem('seconds', seconds);
    }

    if (seconds <= 0) {
      clearInterval(timeUpdate);
      timeLimit = sessionStorage.getItem('initLimit');
      window.location.replace(resultPath);
    }

    else {
      $timer.html(getMinutes(seconds));
    }

    if (seconds <= 10) {
      $timer.css('color', 'red');
    }
  }, 1000);

  var getMinutes = function(seconds) {
    var minutes = Math.floor(seconds / 60);
    var leftSecs = seconds - (minutes * 60);
    return getFormat(minutes) + ":" + getFormat(leftSecs);
  };

  var getFormat = function(value) {
    return value < 10 ? "0" + value : value
  };

  $(this).on('page:before-change turbolinks:before-visit', function() {
    sessionStorage.clear();
    clearInterval(timeUpdate);
  });

  timer();
});


