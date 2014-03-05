$(document).ready(function() {
  var dropDown = $('.dropdown');
  if (dropDown.length) {
    var toggleMenu = $('#' + dropDown.data('toggling'))
    dropDown.click(function(event) {
      toggleMenu
        .css({ width: dropDown.parent().width() })
        .slideToggle(200, 'easeInOutQuad')
    });
  }
});