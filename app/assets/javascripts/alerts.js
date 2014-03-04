$(document).ready(function() {
  var alerts = $("[class*='alert']");

  if (alerts.length) {
    alerts.children('.close').click(function() {
      $(this).parent().slideUp(800, 'easeOutBounce', function() {
        $(this).remove();
      })
    })
  }
});