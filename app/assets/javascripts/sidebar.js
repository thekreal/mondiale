function Sidebar() {
  var sidebar = $('.sidebar'),
      content = $('.content'),
      sidebarToggle = $('.sidebar-toggle');
      sidebarWidth = sidebar.width();

  function sidebarHidden() {
    return sidebar.offset().left === - sidebarWidth ? true : false;
  }

  function bindBtn(element, action) {
    element.click(function() {
      $(this).unbind('click');
      slideLeft();
      action;
    })
  }

  function slideLeft(object, position, action) {
    object.animate({
      left: position
    }, 1200, 'easeInOutCubic', function() {
      action;
    });
  }


  if (sidebarHidden()) {
    bindBtn(
      sidebarToggle,
      slideLeft(sidebar.add(content), '+=240px')
    )
  }

}