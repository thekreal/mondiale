function setWelcomePageHeight() {
  var welcomePage = $('#welcome');
  if (welcomePage.length) {
    welcomePage.height($(window).height());
  }
}