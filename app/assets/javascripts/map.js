
proMapper = {}

proMapper.infoWindow = new google.maps.InfoWindow;

proMapper.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(37.7833, -122.4167),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  proMapper.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}


function initializeMap() {
    proMapper.makeMap();
}

$(document).ready(initializeMap)






