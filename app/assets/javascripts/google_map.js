function initialize() {
  var mapDiv = document.getElementById("map-canvas");
  var objects = $(mapDiv).data('objects');
  var center = $(mapDiv).data('centerPoint');

  var mapOptions = {
    center: new google.maps.LatLng(center[0], center[1]),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(mapDiv, mapOptions);

  var LatLngList = [];
  $(objects).each(function() {
    LatLngList.push(new google.maps.LatLng(this.latitude, this.longitude));
    addMarker(this, map);
  });
  var bounds = new google.maps.LatLngBounds();
  for (var i = 0; i < LatLngList.length; i ++) {
    bounds.extend(LatLngList[i]);
  }
  map.fitBounds(bounds);
}

google.maps.event.addDomListener(window, 'load', initialize);

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

}

function setLatLng(lat, lng) {
  return new google.maps.LatLng(lat, lng);
};

function addInfoWindow(obj) {
  return new google.maps.InfoWindow({
    content: postSummary(obj)
  });
};

function postSummary(obj) {
  return "<h1>" + obj.title + "</h1>" + "<p>" + obj.content + "</p>"
};