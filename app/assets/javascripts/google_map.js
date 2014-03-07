function GoogleMap() {
  var apiUrl = "https://maps.googleapis.com/maps/api/js?",
      aptOpts = {
        key: "AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI",
        libraries: "geometry",
        sensor: true
      };


  this.insertScript = function() {
    $('<script>')
      .attr({ type: 'text/javascript', src: apiUrl + $.param(aptOpts) })
      .appendTo('body');
  };

  this.addInfoWindow = function() {

  }

}

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
  console.log("<image class='thumbnail' src='" + obj.post_attachments[0].postimage.thumb.url + "'>")
  return  "<div class='post-summary'>" +
          "<h1>" + obj.title + "</h1>" +
          "<img class='thumbnail' src='" + obj.post_attachments[0].postimage.thumb.url + "'>"
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
    strokeWeight: 3,
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
