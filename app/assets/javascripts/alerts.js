function flashAlertEffect() {
  var alerts = $("[class*='alert']");

  if (alerts.length) {

    // when clicked on close button, slide up
    alertCloseBtn(alerts)
  }
}
function insertAlert(element, target) {
  element.insertAfter(target)
}

function alertCloseBtn(alerts) {
  alerts.children('.close').click(function() {
    $(this).parent().remove();
  })
}
