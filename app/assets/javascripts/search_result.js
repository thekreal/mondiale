function searchResult() {
  var result = $('.search-result');
  if (result.length) {
    $('.trips-index').outerHeight(windowHeight());

    if (result.length === 0) {
      $('.trips-index').outerHeight(0);
    }
    else if (result.length === 1) {
      result.outerHeight(windowHeight());
    }
    else {
      result.each(function() {
        $(this).outerHeight(windowHeight() / 2);
      })
    }
  }
}

function smoothScroll(object, delay) {
  $('html, body').stop().delay(delay).animate({
    'scrollTop': object.offset().top
  }, 1200, function() {
    window.location.hash = object;
  })
}

function smoothScrollHash(delay) {
  var target = $(window.location.hash);
  $('html, body').delay(1000).stop().animate({
    'scrollTop': target.offset().top
  }, 1200, function() {
  })
}