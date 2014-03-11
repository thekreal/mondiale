function slideUpRemove(obj) {
  obj.animate({
    top: - $(this).height()
  }, 600, 'easeOutCirc', function() {
    $(this).remove();
  });
}

function slideDownShow(obj) {
  obj
    .css({
      top: - $(window).height(),
      left: ($(window).width() - 500) / 2
    })
    .appendTo('body')
    .animate({
      top: 60,
    }, 800, 'easeOutCirc')
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