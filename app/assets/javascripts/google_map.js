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

function setPolyline(map, path, type) {
  type = type || google.maps.SymbolPath.FORWARD_CLOSED_ARROW;
  var line = new google.maps.Polyline({
    path: path,
    geodesic: true,
    strokeColor: '#EE8F8F',
    strokeOpacity: 1.0,
    strokeWeight: 2,
    icons: [{
      icon: { path: type }
    }],
    map: map
  });
};

function setBound(map, path) {
  var bounds = new google.maps.LatLngBounds();
  for (i = 0; i < path.length; i++) {
    bounds.extend(path[i]);
  }
  map.fitBounds(bounds);
};

function mapStyle() {
  return [
    {
      stylers: [
        { hue: '#82ff6b' },
        { visibility: 'simplified' }
      ]
    },
    {
      elementType: 'labels',
      stylers: [
        { visibility: 'on' }
      ]
    },
    {
      featureType: 'water',
      stylers: [
        { color: '#EEEEEE' }
      ]
    },
    {
      featureType: 'road',
      stylers: [
        { color: '#444444'}
      ]
    }
  ];
}

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

$(document).ready(function() {
  if ($('#map-canvas').length) {
    google.maps.event.addDomListener(window, 'load', initialize);
  }
});
