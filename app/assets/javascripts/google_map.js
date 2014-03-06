function initialize() {

  var mapOptions = {
    center: new google.maps.LatLng($('#map-canvas').data("latitude"), $('#map-canvas').data("longitude")),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var mapDiv = document.getElementById("map-canvas");
  var map = new google.maps.Map(mapDiv, mapOptions);
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng($('#map-canvas').data("latitude"), $('#map-canvas').data("longitude")),
    map: map,
    title:"Hello World!"
});

}
google.maps.event.addDomListener(window, 'load', initialize);
