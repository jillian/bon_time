
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
    new google.maps.DirectionsService().route(request, getTripTime);
  };
  
  if (navigator.geolocation) {
    navigator.geolocation
      .getCurrentPosition(getDirections, handleLocationError);
    navigator.geolocation
      .watchPosition(getDirections, handleLocationError);
  } else{
    alert("oops, this browser does not support the HTML5 geolocation API")
  }

  calcRoute()
});

var $hands = $('#liveclock div.hand')

window.requestAnimationFrame = window.requestAnimationFrame
                               || window.mozRequestAnimationFrame
                               || window.webkitRequestAnimationFrame
                               || window.msRequestAnimationFrame
                               || function(f){setTimeout(f, 1000/60)}


function updateclock(){
  var curdate = new Date()
  var hour_as_degree = ( curdate.getHours() + curdate.getMinutes()/60 ) / 12 * 360
  var minute_as_degree = curdate.getMinutes() / 60 * 360
  var second_as_degree = ( curdate.getSeconds() + curdate.getMilliseconds()/1000 ) /60 * 360
  $hands.filter('.hour').css({transform: 'rotate(' + hour_as_degree + 'deg)' })
  $hands.filter('.minute').css({transform: 'rotate(' + minute_as_degree + 'deg)' })
  $hands.filter('.second').css({transform: 'rotate(' + second_as_degree + 'deg)' })
  requestAnimationFrame(updateclock) // 
}

requestAnimationFrame(updateclock)

// var event
// var leaveAlertText = "You should leave your house in "
// $('#leave_alert').html('<h1>'+trip_text+'</h1>');