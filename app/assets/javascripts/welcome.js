function welcomePage() {
  var welcomePage = $('#welcome');
  if (welcomePage.length) {

    var backgroundImage = $('#welcome #background-image');
    var blurCover = $('#welcome #background-image #blur');

    setHeight(welcomePage.add(backgroundImage));
    // setToWindowHeight($('#featured-trips'), windowHeight());
    sidebarToggleBackground();

    $(window).scroll(function() {
      var pos = $(this).scrollTop();
      blurCover.css({ opacity: (pos / windowHeight()) });
      backgroundImage.css('top',(0-(pos*.50))+'px');
      welcomePage.css('top',(0+(pos*.25))+'px');
    })
  }
}
