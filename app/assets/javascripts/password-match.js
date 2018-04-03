$(document).on('turbolinks:load', function() {
  $form = $(document).find('#new_user');

  if ($form) { checkPassword(); }
});

var checkPassword = function() {
  var $password = $(document).find('#user_password');
  var $confirmation = $(document).find('#user_password_confirmation');

  $password.keyup(function(e) {
    if (e.which === 8) { clearStyles($password, $confirmation); }
    checkPasswordMatch($password, $confirmation);
  });

  $password.focusout(function() {
    clearStyles($password, $confirmation);
  });

  $confirmation.keyup(function(e) {
    if (e.which === 8) { clearStyles($password, $confirmation); }
    checkPasswordMatch($confirmation, $password);
  });

  $confirmation.focusout(function() {
    clearStyles($password, $confirmation);
  });
};

var checkPasswordMatch = function(password, confirmation) {
  passwordLength = password.val().length;
  confirmationLength = confirmation.val().length;

  if (passwordLength !== 0 && confirmationLength !== 0) {
    if (password.val() === confirmation.val()) {
      password.css('border', '1px solid green');
      confirmation.css('border', '1px solid green');
    }

    else {
      password.css('border', '1px solid red');
      confirmation.css('border', '1px solid red');
    }
  }
};

var clearStyles = function(password, confirmation) {
  passwordLength = password.val().length;
  confirmationLength = confirmation.val().length;

  if (passwordLength === 0 && confirmationLength === 0 ) {
    password.removeAttr('style');
    confirmation.removeAttr('style');
  }
};
