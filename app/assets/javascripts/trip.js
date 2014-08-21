var directionsService = new google.maps.DirectionsService();

function calcRoute() {
  var start = new google.maps.LatLng(window.starting_location.lat, window.starting_location.lng),
  var end = new google.maps.LatLng(window.event_location.lat, window.event_location.lng);
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
    var trip_time = response.routes[0].legs[0].duration.text;
    var trip_text = "The trip time is " + trip_time
    $('#trip_length').html('<h1>'+trip_text+'</h1>');
      // ajax request -> send duration to attendance model
    })
  }
  function test() {
    console.log("jills the best");
  }
  test();
  );
}
