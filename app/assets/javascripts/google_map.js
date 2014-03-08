function GoogleMap() {

  /* VARIABLES */
  var apiUrl = "https://maps.googleapis.com/maps/api/js?",

      aptOpts = {
        key: "AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI",
        libraries: "geometry",
        sensor: true
      },

      mapCanvas = document.getElementById('map-canvas'),
      objects = $(mapCanvas).data('objects'),
      centerPos = $(mapCanvas).data('centerPos'),

      collectionOfPath = [],
      markers = [],
      map = "";


  function insertScript() {
    $('<script>')
      .attr({ type: 'text/javascript', src: apiUrl + $.param(aptOpts) })
      .appendTo('body');
  };

  function gLatLng(lat, lng, noise) {
    lat = (Math.round(lat * 10000000) / 10000000) + noise;
    lng = (Math.round(lng * 10000000) / 10000000) + noise;
    return new google.maps.LatLng(lat, lng);
  };

  function addInfoWindow(obj) {
    return new google.maps.InfoWindow({
      content: infoWindowContent(obj)
    });
  };

  function infoWindowContent(obj) {
    var wrapper = $('<div>').addClass('post-summary');

    var num_of_images = obj.post_attachments.length;
    if (num_of_images > 0) {
      image = $('<img>').attr({
        class: 'photo',
        src: obj.post_attachments[Math.floor(Math.random() * num_of_images)].postimage.thumb.url
      });
      wrapper.append(image);
    }

    var title = $('<h2>').addClass('title').text(obj.title);
    wrapper.append(title);

    var content = $('<p>').addClass('content').text(obj.content);
    wrapper.append(content);

    var link = $('<a>').attr({
      class: 'link',
      href: obj.trip_id + "/chapters/" + obj.chapter_id
    }).text("link");
    wrapper.append(link);

    var outterWrapper = $('<div>').append(wrapper)

    return outterWrapper.html();
  };

  function addMarker(obj, pos) {
    var infoWindow = addInfoWindow(obj),
        marker = new google.maps.Marker({
          position: pos,
          map: map
        });
    google.maps.event.addListener(marker, 'click', function() {
      infoWindow.open(map, marker);
    });
    markers.push(marker);
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
      zoom: 10,
      center: gLatLng(centerPos[0], centerPos[1]),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
  };

  function initialize() {
    map = new google.maps.Map(mapCanvas, mapOptions());

    $(objects).each(function() {
      var noise = Math.random() / 100;
      var pos = gLatLng(this.latitude, this.longitude, noise);
      collectionOfPath.push(pos);
      addMarker(this, pos);
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


