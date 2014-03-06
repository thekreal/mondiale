function initialize() {
  var mapDiv = document.getElementById("map-canvas");
  var posts = $(mapDiv).data('post');
  console.log(posts)
  var center = $(mapDiv).data('center');
  console.log(center[0])

  var mapOptions = {
    center: new google.maps.LatLng(center[0], center[1]),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };


  var map = new google.maps.Map(mapDiv, mapOptions);

}
google.maps.event.addDomListener(window, 'load', initialize);

function addMarkers() {
  var bounds = map.getBounds();
  var southWest = bounds.getSouthWest();
  var northEast = bounds.getNorthWest();
  var lngSpan = northEast.lng() - southWest.lng();
  var latSpan = northEast.lat() - southWest.lat();
  for (var i = 0; i < 10; i++) {
    var latLng = new google.maps.LatLng(southWest.lat() + latSpan * Math.random(),
                                        northEast.lng() + lngSpan * Math.random());
    var marker = new google.maps.Marker({
      position: latLng,
      map: map
    })
  }
}


// function GoogleMap() {
//   var url = "https://maps.googleapis.com/maps/api/js?",
//       api_key = "key=AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI",
//       api_opts = [api_key, "libraries=geometry", "sensor=false"],
//       access = url + api_opts.join('&');

//   this.a = function() {
//     return access;
//   }

//   this.generateMapCanvas = function() {

//   }
// }