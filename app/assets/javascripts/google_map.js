function initialize() {

  var mapOptions = {
    center: new google.maps.LatLng(37.4419, -122.1419),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var mapDiv = document.getElementById("map-canvas");
  var map = new google.maps.Map(mapDiv, mapOptions);

}
google.maps.event.addDomListener(window, 'load', initialize);
