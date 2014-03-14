function coverPage() {
  var map = $('.cover-map'),
      description = $('.description');

  if (map.height() > description.height()) {
    description.outerHeight(map.height());
  }
  else {
    map.outerHeight(description.height());
  }


}