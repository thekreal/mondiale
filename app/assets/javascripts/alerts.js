function flashAlertEffect() {
  var alerts = $("[class*='alert']");

  if (alerts.length) {
    // slide down to show the message
    alertToggle(alerts);

    // when clicked on close button, slide up
    alertCloseBtn(alerts)
  }
}


function insertAlert(element) {
  element.insertAfter('.navbar')
}

function alertToggle(alerts) {
  alerts = alerts || $("[class*='alert']")
  alerts.slideToggle(800, 'easeInOutQuad');
}

function alertCloseBtn(alerts) {
  alerts.children('.close').click(function() {
    $(this).parent().slideToggle(800, 'easeInOutQuad', function() {
      $(this).remove();
    })
  })
}