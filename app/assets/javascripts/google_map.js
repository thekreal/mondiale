function GoogleMap(obj) {

  /* VARIABLES */
  var apiUrl = "https://maps.googleapis.com/maps/api/js?",

      apiOptions = {
        key: "AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI",
        libraries: "geometry",
        sensor: true,
        callback: 'initialize'
      },

      mapCanvas = obj,
      objects = $(mapCanvas).data('objects'),

      collectionOfPath = [],
      markers = [],
      map = "";

  function geolocation() {
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(p) {
        var pos = gLatLng( p.coords.latitude, p.coords.longitude);
        map.setCenter(pos);
        map.setZoom(12);
      }, function() { handleNoGeolocation(true); });
    } else {
      handleNoGeolocation(false);
    }
  }

  function noise(deg) {
    deg = (Math.round(deg * 10000000) / 10000000);
    start = deg - 0.00800;
    return start + ( Math.random() * 0.01600 );
  }

  function gLatLng(lat, lng, noise_on) {
    if (noise_on === true) {
      lat = noise(lat);
      lng = noise(lng);
    }
    return new google.maps.LatLng(lat, lng);
  };

  function addInfoWindow(obj) {
    return new google.maps.InfoWindow({ content: infoWindowContent(obj) });
  };

  function infoWindowContent(obj) {

    var wrapper = $('<div>').addClass('post-summary');

    var title = $('<h2>').addClass('title').text(obj.title);
    wrapper.append(title);

    var content = $('<p>').addClass('content').text(obj.content);
    wrapper.append(content);

    var link = $('<a>').attr({
      class: 'link',
      href: "/trips/" + obj.trip_id + "/chapters/" + obj.chapter_id
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

    var outterWrapper = $('<div>').append(wrapper);
    return outterWrapper.html();
  };

  function addMarker(obj, pos) {
    var icon = {
      url: '/assets/map-marker-red.png',
      size: new google.maps.Size(32, 32)
    };
    var infoWindow = addInfoWindow(obj);
    var marker = new google.maps.Marker({
          position: pos,
          map: map,
          icon: icon,
          zIndex: 5
        });

    console.log(infoWindow)
    google.maps.event.addListener(marker, 'click', function() {
      map.setCenter(marker.getPosition())

      infoWindow.open(map, marker);
      google.maps.event.addListener(map, 'click', function() {
        infoWindow.close();
      })
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
    setBound();
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
      customMapType: { name: 'MAP' },
      featureOpts: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]
    }
  }

  function mapOptions() {
    return {
      zoom: 4,
      mapTypeControl: true,
      mapTypeControlOptions: {
        mapTypeIds: [mapStyle().id],
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
    if (objects.length > 0) {
      $(objects).each(function() {
        var pos = gLatLng(this.latitude, this.longitude);
        collectionOfPath.push(pos);
        addMarker(this, pos);
      });
      addPolyline();
    }
    else {
      geolocation();
    }

  };

  return (function() {
      google.maps.event.addDomListener(window, 'load', initialize);
    })();

};


