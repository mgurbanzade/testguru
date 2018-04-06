document.addEventListener('turbolinks:load', function() {
  var errors = document.querySelector('ul.alert');

  $('.form-inline-link').on('click', formInlineLinkHandler);

  if (errors) {
    var resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
});

function formInlineLinkHandler(e) {
  var testId = this.dataset.testId;

  e.preventDefault();
  formInlineHandler(testId);
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]');
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]');

  $formInline.toggle();
  $testTitle.toggle();

  if (link) {
    if ($formInline.is(':visible')) {
      link.textContent = 'Отмена'
    }

    else {
      link.textContent = 'Обновить'
    }
  }
}
