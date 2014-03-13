function slideUpRemove(obj) {
  obj.animate({
    top: - $(this).height()
  }, 800, 'easeOutCubic', function() {
    $(this).remove();
  });
}

function slideDownShow(obj) {
  obj
    .appendTo('body')
    .css({
      top: - $(window).height(),
      left: ($(window).width() - obj.width()) / 2
    })
    .animate({
      top: 30,
    }, 1000, 'easeOutCubic')
}

function clickToClose(click_obj, remove_obj) {
  click_obj.on('click', function(e) {
    e.preventDefault;
    slideUpRemove(remove_obj);
    removeBlur();
  })
}

function addBlur(isnertTo) {
  return $('<div>')
  .hide()
  .addClass('blur-background')
  .appendTo(isnertTo)
  .fadeIn(400, function() {
  });
}

function removeBlur() {
  $('.blur-background').fadeOut(400, function() {
    blurBackground.remove();
  });
}
