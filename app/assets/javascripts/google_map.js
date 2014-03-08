function GoogleMap() {

  /* VARIABLES */
  var apiUrl = "https://maps.googleapis.com/maps/api/js?",

      apiOptions = {
        key: "AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI",
        libraries: "geometry",
        sensor: true,
        callback: 'initialize'
      },

      mapCanvas = document.getElementById('map-canvas'),
      objects = $(mapCanvas).data('objects'),

      collectionOfPath = [],
      markers = [],
      map = "";


  function loadScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = apiUrl + $.param(apiOptions)
    document.body.appendChild(script);
  };

  function noise(deg) {
    start = deg - 0.00800;
    return start + ( Math.random() * 0.01600 );
  }

  function gLatLng(lat, lng) {
    lat = (Math.round(lat * 10000000) / 10000000);
    lng = (Math.round(lng * 10000000) / 10000000);
    console.log(noise(lat), noise(lng))
    return new google.maps.LatLng(noise(lat), noise(lng));
  };

  function addInfoWindow(obj) {
    return new google.maps.InfoWindow({
      content: infoWindowContent(obj)
    });
  };

  function infoWindowContent(obj) {
    var wrapper = $('<div>').addClass('post-summary');

    var title = $('<h2>').addClass('title').text(obj.title);
    wrapper.append(title);

    var content = $('<p>').addClass('content').text(obj.content);
    wrapper.append(content);

    var link = $('<a>').attr({
      class: 'link',
      href: obj.trip_id + "/chapters/" + obj.chapter_id
    }).text("link");
    wrapper.append(link);

    var num_of_images = obj.post_attachments.length;
    if (num_of_images > 0) {
      image = $('<img>').attr({
        class: 'photo',
        src: obj.post_attachments[Math.floor(Math.random() * num_of_images)].postimage.thumb.url
      });
      wrapper.append(image);
    }

    var outterWrapper = $('<div>').append(wrapper)

    return outterWrapper.html();
  };

  function addMarker(obj, pos) {
    var icon = {
      url: '/assets/map-marker-red.png',
      size: new google.maps.Size(32, 32)
    };

    var marker = new google.maps.Marker({
          position: pos,
          map: map,
          icon: icon,
          zIndex: 5
        });
    google.maps.event.addListener(marker, 'click', function() {
      map.setCenter(marker.getPosition())
      addInfoWindow(obj).open(map, marker);
    });
    markers.push(marker);
  };

  function addPolyline(type) {
    type = type || google.maps.SymbolPath.FORWARD_CLOSED_ARROW;
    var line = new google.maps.Polyline({
      path: collectionOfPath,
      geodesic: true,
      strokeColor: "#e38f83",
      strokeOpacity: 1.0,
      strokeWeight: 2,
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

  function mapStyle() {
    return {
      id: 'custom_style',
      customMapType: { name: 'Custom Style' },
      featureOpts: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]
    }
  }

  function mapOptions() {
    return {
      zoom: 4,
      mapTypeControl: true,
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, mapStyle().id],
        style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
        position: google.maps.ControlPosition.BOTTOM_CENTER
      },
      mapTypeId: mapStyle().id
    };
  };

  function initialize() {
    map = new google.maps.Map(mapCanvas, mapOptions());

    var customMapType = new google.maps.StyledMapType(
      mapStyle().featureOpts, mapStyle().customMapType
    );

    map.mapTypes.set(mapStyle().id, customMapType);
    console.log(objects.length)
    $(objects).each(function() {
      var pos = gLatLng(this.latitude, this.longitude);
      collectionOfPath.push(pos);
      addMarker(this, pos);
    });
    addPolyline();
    setBound();
  };

  function run() {
    google.maps.event.addDomListener(window, 'load', initialize);
  };

  run();
};


