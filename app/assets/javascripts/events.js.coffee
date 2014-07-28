# initialize = ->
#   directionsService = new google.maps.DirectionsService();
#   mode = transport_mode
#   to = window.event_location
#   from = window.starting_location

#   # example of getting event location
  

#   directionsService = new google.maps.DirectionsService();
  
#   calcRoute = ->
#     request =
#       origin: new google.maps.LatLng(from.lat,from.lng)
#       destination: new google.maps.LatLng(to.lat,to.lng)
#       travelMode: google.maps.TravelMode[mode]

#     directionsService.route request, (response, status) ->
#         trip_time = response.routes[0].legs[0].duration.text
#         console.log("your trip is " + trip_time + " long") 
    
#     # $("#directions-panel").html("")
#     #       directionsDisplay.setPanel(document.getElementById("directions-panel"))
#     #     }else{
#     #       alert("something went wrong")
#     #     }
#     #   })
#     #   return false;
#     # });

#   # $("#directions_form").on("submit", function(){
#   #   from = $("#directions_from").val();
#   #   to   = $("#directions_to").val();
#   #   mode = $("#directions_mode").val();
#   #   var request = {
#   #     origin: from,
#   #     destination: to,
#   #     travelMode: google.maps.TravelMode[mode]
#   #   };

#   #   directionsService.route(request, function(response, status){
#   #     if(status == google.maps.DirectionsStatus.OK){
#   #       directionsDisplay.setDirections(response)
#   #       $("#directions-panel").html("")
#   #       directionsDisplay.setPanel(document.getElementById("directions-panel"))
#   #     }else{
#   #       alert("something went wrong")
#   #     }
#   #   })
#   #   return false;
#   # });


#  # javascript geolocation api
#   updateLocation = (position) ->
#     coords = position.coords;
#     alert("your position is: lat-> "+ coords.latitude + " - lng ->"+coords.longitude)


#   handleLocationError = (error) ->
#     alert(error)

#   if (navigator.geolocation) 
#     navigator.geolocation.getCurrentPosition(updateLocation, handleLocationError); 
#     # navigator.geolocation.watchPosition(updateLocation, handleLocationError);
#   else
#     alert("oops, this browser does not support HTML5 geolocation API")



# $(initialize)


# calcRoute() 