function coverPage() {
  var map = $('.googleMap .cover-map'),
      description = $('.description');

  if (map.height() > description.height()) {
    description.outerHeight(map.height());
  }
  else {
    map.outerHeight(description.height());
  }


}