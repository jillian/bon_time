
$(document).ready(function(){
  console.log("heyooo")

/*******clock ********/
function clock() {


  var $hands = $('div.hand')

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
    requestAnimationFrame(updateclock) 
  }

  requestAnimationFrame(updateclock)
  };

  if (window.showClock) {
    clock();
  };

  /*****end of clock ******/

  /*****trip duration with Google Maps API **************/

  var directionsService = new google.maps.DirectionsService();

  function calcRoute() {

    var request = {
      origin: new google.maps.LatLng(window.starting_location.lat, window.starting_location.lng),
      destination: new google.maps.LatLng(window.event_location.lat, window.event_location.lng),
      travelMode: google.maps.TravelMode[transport_mode]
    };

    directionsService.route(request, function(response, status){
      var trip_time = response.routes[0].legs[0].duration.text;
      var trip_text = "The trip time is " + trip_time
      $('#trip_length').html('<h1>'+trip_text+'</h1>');
      // ajax request -> send duration to attendance model
    });
  };

  function handleLocationError(error){
    alert(error)
  };

  var getTripTime = function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
     var trip_time = response.routes[0].legs[0].duration.text;

    } else{
      console.log("something went wrong")
    }
  };

  var getDirections = function(location) {

    var request = {
      origin: new google.maps.LatLng(window.starting_location.lat, window.starting_location.lng),
      destination: new google.maps.LatLng(window.event_location.lat, window.event_location.lng),
      travelMode: google.maps.TravelMode[transport_mode]
    };

    directionsDisplay = new google.maps.DirectionsRenderer();
    new google.maps.DirectionsService().route(request, getTripTime);
  };
  
  //************** USE GEOCODER

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(getDirections, handleLocationError);
    navigator.geolocation.watchPosition(getDirections, handleLocationError);
  } else{
    console.log("oops, this browser does not support the HTML5 geolocation API")
  }

  if (window.runCalc) {
    calcRoute();
  };


  /********end of trip duration calculation***********/
});






// var event
// var leaveAlertText = "You should leave your house in "
// $('#leave_alert').html('<h1>'+trip_text+'</h1>');