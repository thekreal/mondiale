function welcomePage() {
  var welcomePage = $('#welcome');
  if (welcomePage.length) {
    var windowHeight = $(window).height() < 500 ? 500 : $(window).height();
    var backgroundImage = $('#welcome #background-image');
    var blurCover = $('#welcome #background-image #blur');

    welcomePage.add(backgroundImage).height(windowHeight);


    $(window).scroll(function() {
      var pos = $(this).scrollTop();
      blurCover.css({ opacity: (pos / windowHeight) });
      backgroundImage.css('top',(0-(pos*.25))+'px');
    })

  }
}
