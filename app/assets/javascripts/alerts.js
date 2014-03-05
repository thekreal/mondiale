$(document).ready(function() {
  var alerts = $("[class*='alert']");

  // if there is an alert
  if (alerts.length) {

    // slide down to show the message
    alerts.slideToggle(800, 'easeInOutQuad');

    // when clicked on close button, slide up
    alerts.children('.close').click(function() {
      $(this).parent().slideToggle(800, 'easeInOutQuad', function() {
        $(this).remove();
      })
    })

  }
});