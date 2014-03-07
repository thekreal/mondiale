function GoogleMap() {

  /* VARIABLES */
  var apiUrl = "https://maps.googleapis.com/maps/api/js?",

      aptOpts = {
        key: "AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI",
        libraries: "geometry",
        sensor: true
      };

      mapCanvas = document.getElementById('map-canvas'),
      objects = $(mapCanvas).data('objects'),
      centerPos = $(mapCanvas).data('centerPos'),

      collectionOfPath = [];

      map = "";

  function insertScript() {
    $('<script>')
      .attr({ type: 'text/javascript', src: apiUrl + $.param(aptOpts) })
      .appendTo('body');
  };

  function gLatLng(lat, lng) {
    return new google.maps.LatLng(lat, lng);
  };

  function addInfoWindow(obj) {
    return new google.maps.InfoWindow({
      content: infoWindowContent(obj)
    });
  };

  function infoWindowContent(obj) {
    return "<h1>HI</h1>";
  };

  function addMarker(obj) {
    var pos = gLatLng(obj.latitude, obj.longitude),
        infoWindow = addInfoWindow(obj),
        marker = new google.maps.Marker({
          position: pos,
          map: map
        });
    google.maps.event.addListener(marker, 'click', function() {
      infoWindow.open(map, marker);
    });
  };

  function addPolyline(type) {
    type = type || google.maps.SymbolPath.FORWARD_CLOSED_ARROW;
    var line = new google.maps.Polyline({
      path: collectionOfPath,
      geodesic: true,
      strokeColor: "#EE8F8F",
      strokeOpacity: 1.0,
      strokeWeight: 3,
      icons: [{
        icon: { path: type }
      }],
      map: map
    });
  };

  function setBound() {
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0; i < collectionOfPath.length; i++) {
      bounds.extend(collectionOfPath[i]);
    }
    map.fitBounds(bounds);
  };

  function mapOptions() {
    return {
      zoom: 8,
      center: gLatLng(centerPos[0], centerPos[1]),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
  };

  function initialize() {
    map = new google.maps.Map(mapCanvas, mapOptions());
    $(objects).each(function() {
      collectionOfPath.push(gLatLng(this.latitude, this.longitude));
      addMarker(this);
    });
    addPolyline();
    setBound();
  };

  function run() {
    google.maps.event.addDomListener(window, 'load', initialize);
  };

  initialize();
  run();
};


