function searchResult() {
  var result = $('.search-result');
  if (result.length) {
    $('.trips-index').outerHeight(windowHeight());
    result.each(function() {
      $(this).outerHeight(windowHeight() / 2);
    })

  }
}

function smoothScroll(object, delay) {
  $('html, body').delay(delay).stop().animate({
    'scrollTop': object.offset().top
  }, 1200, function() {
    window.location.hash = object;
  })
}