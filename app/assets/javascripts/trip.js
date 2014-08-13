var directionsService = new google.maps.DirectionsService();

function calcRoute() {
  var start = new google.maps.LatLng(window.starting_location.lat,starting_location.lng),
  var end = new google.maps.LatLng(window.event_location.lat,event_location.lng);
  var travelMode: google.maps.TravelMode[transport_mode]
  var request = {
    origin:start,
    destination:end,
    travelMode: travelMode
  };
  directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
    }
  });
}
