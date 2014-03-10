function sidebar() {
  var self = $('.sidebar'),
      content = $('.content'),
      sidebarToggle = $('.sidebar-toggle');
      sidebarWidth = self.width();

  function currentlyHidden() {
    return content.offset().left > 0 ? false: true
  };
  function direction() {
    return currentlyHidden() ? 240 : 0;
  };
  function slideAnimate() {
    content.add(sidebarToggle).animate({
      left: direction()
    }, {
      duration: 800,
      easing: 'easeOutCirc',
      queue: false,
      done: function() {
        bindContent();
      }
    });
  };
  function onClick(btn, unbind) {
    unbind = unbind || false
    btn.on('click', function(e) {
      e.preventDefault();
      slideAnimate();
      if (unbind === true) {
        $(this).unbind('click');
      }
    })
  }
  function bindContent() {
    if (!currentlyHidden()) {
      onClick(content, true);
    };
  };
  function initialize() {
    onClick(sidebarToggle);
  }
  initialize();
}