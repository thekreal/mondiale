function initialize() {
  var mapDiv = document.getElementById("map-canvas");
  var posts = $(mapDiv).data('post');
  var center = $(mapDiv).data('center');

  var mapOptions = {
    center: new google.maps.LatLng(center[0], center[1]),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(mapDiv, mapOptions);

  $(posts).each(function() {
    addMarker(this, map);
  });

}

google.maps.event.addDomListener(window, 'load', initialize);

function addMarker(obj, map) {
  var pos = new google.maps.LatLng(obj.latitude, obj.longitude);

  var infoWindow = new google.maps.InfoWindow({
    content: "<h1>" + obj.title + "</h1>" + "<p>" + obj.content + "</p>"
  });

  var marker = new google.maps.Marker({
    position: pos,
    map: map
  });

  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.open(map, marker);
  })

}



// google.maps.event.addListener(map, 'click', function() {
//   alert('hi');
// });