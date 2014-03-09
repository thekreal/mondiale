function welcomePage() {
  var welcomePage = $('#welcome');
  if (welcomePage.length) {

    welcomePage.height($(window).height());

    beforeScrollPos = 0;
    $(window).scroll(function() {
      var afterScrollPos = $(this).scrollTop();
      $('#blur').css({ opacity: (afterScrollPos / $(window).height()) });
    })

  }
}
