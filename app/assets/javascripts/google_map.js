function addInfoWindow(obj) {
  return new google.maps.InfoWindow({
    content: postSummary(obj)
  });
};

function addMarker(obj, map) {
  var pos = setLatLng(obj.latitude, obj.longitude);
  var infoWindow = addInfoWindow(obj);
  var marker = new google.maps.Marker({
    position: pos,
    map: map
  });

  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.open(map, marker);
  })
};

function postSummary(obj) {
  return "<h1>" + obj.title + "</h1>" + "<p>" + obj.content + "</p>"
};

function setLatLng(lat, lng) {
  return new google.maps.LatLng(lat, lng);
};

function mapOptions(centerPos) {
  return {
    zoom: 8,
    center: setLatLng(centerPos[0], centerPos[1]),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
}

function setPolyline(map, path) {
  new google.maps.Polyline({
    path: path,
    geodesic: true,
    strokeColor: '#EE8E8E',
    strokeOpacity: 1.0,
    strokeWeight: 2
  }).setMap(map);
};

function setBound(map, path) {
  var bounds = new google.maps.LatLngBounds();
  for (i = 0; i < path.length; i++) {
    bounds.extend(path[i]);
  }
  map.fitBounds(bounds);
};

function initialize() {
  var mapDiv = document.getElementById("map-canvas");
  var objects = $(mapDiv).data('objects');
  var centerPos = $(mapDiv).data('centerPoint');

  var map = new google.maps.Map(mapDiv, mapOptions(centerPos));

  var collectionOfPath = [];
  $(objects).each(function() {
    collectionOfPath.push(setLatLng(this.latitude, this.longitude));
    addMarker(this, map);
  });
  setPolyline(map, collectionOfPath);
  setBound(map, collectionOfPath);

}

google.maps.event.addDomListener(window, 'load', initialize);