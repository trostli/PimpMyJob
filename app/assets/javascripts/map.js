proMapper = {}

var markersArray = []
var counter = 0
proMapper.infoWindow = new google.maps.InfoWindow;

proMapper.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(32.7150, -117.1625),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  proMapper.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}

proMapper.getMarkers = function(e) {
    e.preventDefault();
    console.log("AJAX!")
    $.ajax({
      url:"/categories",
      type: "GET",
      dataType: "json",
      data: $('#category_form').serialize()
    }).done(proMapper.saveMarkers)
}

proMapper.saveMarkers = function(markerData) {
  proMapper.clearMarkers();
  proMapper.markerData = markerData;
  proMapper.MakeMarkers(markerData);
}

proMapper.MakeMarkers = function(markerData) {
  var self = this
  $.each(markerData, function(index, element) {
    var contentInfo = '<p>' + '<strong>Title: </strong>' + String(element.title) + '</p>'
    +  '<p>' + '<strong>Compensation: </strong>'  + String(element.compensation) + '</p>'
    + '<p>' + '<strong>Description: </strong>'  + String(element.description) + '</p>'
    + '<p>' + '<strong>Address: </strong>'  + String(element.address) + '</p>';

    var marker = self.makeMarker(index, element)

    google.maps.event.addListener(marker, 'mouseover', function() {

      proMapper.infoWindow.setOptions({disableAutoPan : true })

      proMapper.infoWindow.open(proMapper.map, marker)

      var content =  contentInfo;
      // var link = '<a href=/spots/' + spot_id + '>Reserve this Spot</a>'

      proMapper.infoWindow.setContent(content)

    });
  });
}

proMapper.makeMarker = function (index, markerData) {
  console.log("YEAH!")
  global = markerData
  var myLatlng = new google.maps.LatLng(markerData.latitude, markerData.longitude)

  var num = index

  var marker = new google.maps.Marker({

    position: myLatlng,

    title: 'Click to Zoom',

    icon: 'https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld='+num+'|FF0000|000000'

  });
  marker.setMap(this.map);
  markersArray.push(marker);

  return marker
}

proMapper.clearMarkers = function() {
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }

  markersArray.length = 0;

}



function initializeMap() {
    proMapper.makeMap();
    $('#category_form').on('submit', proMapper.getMarkers);
}


google.maps.event.addDomListener(window, "load", initializeMap);







