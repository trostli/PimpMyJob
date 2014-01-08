proMapper = {}

proMapper.infoWindow = new google.maps.InfoWindow;

proMapper.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(32.7150, -117.1625),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  proMapper.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}

proMapper.getMarkers = function() {
    $.ajax({
      url:"/categories",
      type: "GET",
      dataType: "json"
    }).done(proMapper.saveMarkers)
}

proMapper.saveMarkers = function(markerData) {
  proMapper.markerData = markerData;
}

function initializeMap() {
    proMapper.makeMap();
    proMapper.getMarkers();
}


google.maps.event.addDomListener(window, "load", initializeMap);







