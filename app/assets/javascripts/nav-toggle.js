$(document).ready(function() {
  $hamburger = $(document).find('.hamburger');
  $navItems = $(document).find('.navigation-items');

  $hamburger.click(function() {
    $(this).toggleClass('open');

    $navItems.slideToggle(500, function(){
      if ($navItems.css('display') === 'none') {
        $navItems.removeAttr('style');
      }
    });
  });
});
