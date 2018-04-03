$(document).on('turbolinks:load', function() {
  var $control = $(document).find('.sort-by-title');

  if ($control) { $control.click(sortRowsByTitle) }
});

var sortRowsByTitle = function () {
  var $table = $(document).find('.table.table-striped')
  var $tbody = $(document).find('table > tbody');
  var $rows = $table.find('tr');
  var $up = $(document).find('.arrow-up');
  var $down = $(document).find('.arrow-down');
  var sortedRows = [];

  $rows.each(function() {
    sortedRows.push($(this));
  });

  if ($up.is(':hidden')) {
    sortedRows.sort(compareRowsAsc);
    $up.css('display', 'inline-block');
    $down.hide();
  }

  else {
    sortedRows.sort(compareRowsDesc)
    $up.hide();
    $down.removeAttr('style');
  }

  $table.prepend($rows[0]);

  $(sortedRows).each(function() {
    $table.append($(this));
  });
};

var compareRowsAsc = function(row1, row2) {
  var title1 = row1.find('td').html();
  var title2 = row2.find('td').html();

  if (title1 < title2) { return - 1 }
  if (title1 > title2) { return 1 }
  return 0
};

var compareRowsDesc = function (row1, row2) {
  var title1 = row1.find('td').html();
  var title2 = row2.find('td').html();

  if (title1 < title2) { return 1 }
  if (title1 > title2) { return - 1 }
  return 0
};











