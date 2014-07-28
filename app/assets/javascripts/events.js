$(document).ready(function(){
  directionsService = new google.maps.DirectionsService();

  function calcRoute() {

    var request = {
      origin: new google.maps.LatLng(window.starting_location.lat,starting_location.lng),
      destination: new google.maps.LatLng(window.event_location.lat,event_location.lng),
      travelMode: google.maps.TravelMode[transport_mode]
    };

    directionsService.route(request, function(response, status){
      var trip_time = response.routes[0].legs[0].duration.text;
      var trip_text = "The trip time is " + trip_time
      console.log(trip_text);
      $('#trip_length').html('<h1>'+trip_text+'</h1>');
    });
  };

  function handleLocationError(error){
    alert(error)
  };

  var getTripTime = function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
     var trip_time = response.routes[0].legs[0].duration.text;
     alert("The trip time is " + trip_time + " units")
    } else{
      alert("something went wrong")
    }
  };

  // Javascript Geolocation API
  var getDirections = function(location) {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var mapOptions = {
      zoom: 14,
      center: new google.maps.LatLng(
        location.coords.latitude, location.coords.longitude
      )
    }
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    directionsDisplay.setMap(map);
    new google.maps.DirectionsService().route(request, getTripTime);
  };
  

  if (navigator.geolocation) {
    navigator.geolocation
      .getCurrentPosition(getDirections, handleLocationError);
    navigator.geolocation
      .watchPosition(getDirections, handleLocationError);
  } else{
    alert("oops, this browser does not support HTML5 geolocation API")
  }

  calcRoute()
});
// var event
// var leaveAlertText = "You should leave your house in "
// $('#leave_alert').html('<h1>'+trip_text+'</h1>');