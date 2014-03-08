function navbarBackground() {
  var win = $(window),
      navbar = $('header.navbar');

  win.scroll(function(event) {
    if (win.scrollTop() > 200) {
      navbar.addClass('navbarBackground');
    }
    else {
      navbar.removeClass('navbarBackground');
    }
  });
}