function coverPage() {
  var map = $('.cover-map');
  if (map.length) {
    var m = new GoogleMap(map)
    map.addClass('large-6 columns');
  }
}