function welcomePage() {
  var welcomePage = $('#welcome');
  if (welcomePage.length) {

    var backgroundImage = $('#welcome #background-image');
    var blurCover = $('#welcome #background-image #blur');

    setToWindowHeight(welcomePage.add(backgroundImage));
    setToWindowHeight($('#featured-trips'), windowHeight());
    sidebarToggleBackground();

    $(window).scroll(function() {
      var pos = $(this).scrollTop();
      blurCover.css({ opacity: (pos / windowHeight()) });
      backgroundImage.css('top',(0-(pos*.50))+'px');
      welcomePage.css('top',(0+(pos*.25))+'px');
    })
  }
}

function windowHeight() {
  return $(window).height() < 500 ? 500 : $(window).height();
}

function setToWindowHeight(obj, minHeight) {
  minHeight = minHeight || false
  if (minHeight && obj.height() < minHeight) {
    obj.outerHeight(windowHeight());
  }
  else if (!minHeight) {
    obj.outerHeight(windowHeight());
  }
}
