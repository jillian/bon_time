window.LocationManager = {
  
  transport_mode: null,
  
  start: {
    lat: null,
    lng: null
  },
  
  end: {
    lat: null,
    lng: null
  },
  
  getRequestParams: function() {
    return {
      origin: new google.maps.LatLng(this.start.lat, this.start.lng),
      destination: new google.maps.LatLng(this.end.lat, this.end.lng),
      travelMode: google.maps.TravelMode[this.transport_mode]
    };
  },

  hasStartLocation: function() {
    return this.start.lat && this.start.lng;
  },

  hasEndLocation: function() {
    return this.end.lat && this.end.lng;
  },

  hasLocations: function() {
    return this.hasEndLocation() && this.hasStartLocation();
  },

  getDirections: function(location) {
    var directionsDisplay = new google.maps.DirectionsRenderer();

    if (LocationManager.hasLocations()) {
      new google.maps.DirectionsService().route(
        LocationManager.getRequestParams(), LocationManager.getTripTime
      );
    }
  },

  // var response = {
  //   routes: [
  //     { 
  //       legs: [
  //         {
  //           duration: {
  //             text: 'foo'
  //           }
  //         }
  //       ]
  //     }
  //   ]
  // };
  // LocationManager.setTimeText(response);
  // var element = {
  //   html: jasmine.createSpy('html')
  // };
  // spyOn(window, '$').and.returnValue(element);
  // expect(element.html).toHaveBeenCalledWith('<h1>The trip time is foo</h1>');

  setTimeText: function(response, status) {
    var trip_duration = response.routes[0].legs[0].duration;
    var trip_text = "The trip time is " + trip_duration.text
    $('#trip_length').html('<h1>'+trip_text+'</h1>');
    $('#trip_duration').val(trip_duration.value);
    $('#submit').attr("disabled", null);
  },

  // spyOn(google.maps, 'DirectionsService')
  // expect(google.maps.DirectionsService).toHaveBeenCalled();
  // expect(route).toHaveBeenCalledWith({ lat: 5, lng: 10 })
  // spyOn(LocationManager, 'setTimeText').and.returnValue('foo');
  // expect(route).toHaveBeenCalledWith({ lat: 5, lng: 10 }, 'foo');
  // expect(LocationManager.setTimeText).toHaveBeenCalled();

  calcRoute: function() {
    var directionsService = new google.maps.DirectionsService();

    // BAD
    // directionsService.route(LocationManager.request_params, function(response, status) {
    //   var trip_time = response.routes[0].legs[0].duration.text;
    //   var trip_text = "The trip time is " + trip_time
    //   $('#trip_length').html('<h1>'+trip_text+'</h1>');
    //   // ajax request -> send duration to attendance model
    // });
  
    // GOOD
    if (LocationManager.hasLocations()) {
      directionsService.route(
        LocationManager.getRequestParams(), LocationManager.setTimeText
      );
    }
  },

  getTripTime: function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
     var trip_time = response.routes[0].legs[0].duration.text;
    } else{
      console.log("something went wrong")
    }
  }

};

$(document).ready(function(){

  /*******clock ********/
  function clock() {


    var $hands = $('div.hand')

    window.requestAnimationFrame = window.requestAnimationFrame
                                 || window.mozRequestAnimationFrame
                                 || window.webkitRequestAnimationFrame
                               || window.msRequestAnimationFrame
                               || function(f){setTimeout(f, 1000/60)
  }

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

  

  function handleLocationError(error){
    alert(error)
  };
  
  //************** USE GEOCODER

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(LocationManager.getDirections, handleLocationError);
    navigator.geolocation.watchPosition(LocationManager.getDirections, handleLocationError);
  } else{
    console.log("oops, this browser does not support the HTML5 geolocation API")
  }

  // if (window.runCalc) {
  //   calcRoute();
  // };

  /********end of trip duration calculation***********/
});

// var meow = function() {}
// window.meow = function() {}  

// var event
// var leaveAlertText = "You should leave your house in "
// $('#leave_alert').html('<h1>'+trip_text+'</h1>');