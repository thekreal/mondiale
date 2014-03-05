function removeSigninForm() {
  $('.signin-form').animate({
    right: - $(this).width()
  }, 400, 'easeInOutQuad', function() {
    signinForm.remove();
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