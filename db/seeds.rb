User.delete_all
jill = User.create!(first_name: 'Jillian',
  last_name: 'Macnaughton',
  email: 'jill@jill.com',
  password: 'password',
  password_confirmation: 'password',
  mobile_number: '07709642384'
  )
heather = User.create!(first_name: 'Heather',
  last_name: 'Mac',
  email: 'heather@heather.com',
  password: 'password',
  password_confirmation: 'password',
  mobile_number: '07709642385'
  )
caro = User.create!(first_name: 'Caroline',
  last_name: 'Ferriswheel',
  email: "caroline@ferriswheel.com",
  password: 'password',
  password_confirmation: 'password',
  mobile_number: '84932843'
  )
jon = User.create!(email: "jon@chambers.com",
  password: 'password',
  password_confirmation: 'password',
  first_name: "jon",
  last_name: "chambers",
  mobile_number: '8493802')
jmac = User.create!(email: "jillian@mac.com",
  password: "password",
  password_confirmation: 'password',
  first_name: "jillian",
  last_name: "mac",
  mobile_number: '07709642384')
gerry = User.create!(first_name: 'Gerry',
  last_name: 'Mathe',
  email: 'gerry@mathe.com',
  password: 'password',
  password_confirmation: 'password',
  mobile_number: '84932843'
  )
sri = User.create!(first_name: 'Sri',
  last_name: 'Mohan',
  email: 'sri@mohan.com',
  password: 'password',
  password_confirmation: 'password',
  mobile_number: '84932843'
  )
sarah = User.create!(first_name: 'Sarah',
  last_name: 'Knight',
  email: 'sarah@knight.com',
  password: 'password',
  password_confirmation: 'password',
  mobile_number: '4732847829'
  )


location1 = Location.create(address: '27 Stockfield Road',
  city: 'London',
  postcode: 'SW16 2LU',
  location_label: 'home',
  addressable_type: 'user'
  )
location2 = Location.create(address: '58 Barnsbury Road',
  city: 'London',
  postcode: 'N1 0HD',
  location_label: 'home',
  addressable_type: 'user'
  )
location3 = Location.create(address: '58 Barnsbury Road',
  city: 'London',
  postcode: 'N1 0HD',
  location_label: 'home',
  addressable_type: 'user'
  )
location4 = Location.create(address: '7 Fortune Green Road',
  city: 'London',
  postcode: 'NW6 1DP',
  location_label: 'home',
  addressable_type: 'user'
  )
location5 = Location.create(address: '9 Back Hill',
  city: 'London',
  postcode: 'EC1R 5EN',
  addressable_type: 'event')
location6 = Location.create(address: '25 Heddon St',
  city: 'London',
  postcode: 'W1B 4BH',
  addressable_type: 'event'
  )
location7 = Location.create(address: '41 Jews Road',
  city: 'London',
  postcode: 'SW18 1TB',
  addressable_type: 'event'
  )


event1 = Event.create(start_time: '04/09/2015 21:00',
  creator_id: 6,
  location_id: location3.id,
  name: 'dinner'
  )
event2 = Event.create(start_time: '05/08/2015 21:00',
  creator_id: 6,
  location_id: location3.id,
  name: 'lunch'
  )
event3 = Event.create(start_time: '06/08/2015 21:00',
  creator_id: 6,
  location_id: location3.id,
  name: 'dinner'
  )
event4 = Event.create(start_time: '07/08/2015 21:00',
  creator_id: 6,
  location_id: location4.id,
  name: 'drinks'
  )
event5 = Event.create(start_time: '08/08/2015 21:00',
  creator_id: 6,
  location_id: location4.id,
  name: 'snack'
  )
event6 = Event.create(start_time: '07/08/2015 21:00',
  creator_id: 6,
  location_id: location4.id,
  name: 'coffee'
  )
attendance1 = Attendance.create(event_id: 1,
  starting_location_id: location2.id,
  accepted: true,
  trip_duration: nil,
  attendee_id: jon.id,
  creator_id: gerry.id,
  transport_mode: 'walking'
  )
attendance2 = Attendance.create(event_id: 2,
  starting_location_id: location2.id,
  accepted: true,
  trip_duration: nil,
  attendee_id: jon.id,
  creator_id: gerry.id,
  transport_mode: 'driving'
  )
attendance3 = Attendance.create(event_id: 3,
  starting_location_id: location2.id,
  accepted: true,
  trip_duration: nil,
  attendee_id: jon.id,
  creator_id: gerry.id,
  transport_mode: 'cycling'
  )
attendance4 = Attendance.create(event_id: 4,
  starting_location_id: location1.id,
  accepted: true,
  trip_duration: nil,
  attendee_id: gerry.id,
  creator_id: sarah.id,
  transport_mode: 'cycling'
  )
attendance5 = Attendance.create(event_id: 3,
  starting_location_id: location1.id,
  accepted: true,
  trip_duration: nil,
  attendee_id: gerry.id,
  creator_id: sarah.id,
  transport_mode: 'walking'
  )
attendance6 = Attendance.create(event_id: 3,
  starting_location_id: location1.id,
  accepted: true,
  trip_duration: nil,
  attendee_id: gerry.id,
  creator_id: sarah.id,
  transport_mode: 'driving'
  )


Friendship.create!(
  user_id: gerry.id,
  friend_id: jon.id,
  approved: true,
)
Friendship.create!(
  user_id: gerry.id,
  friend_id: sarah.id,
  approved: true,
)
Friendship.create!(
  user_id: gerry.id,
  friend_id: jmac.id,
  approved: nil,
)
Friendship.create!(
  user_id: sri.id,
  friend_id: gerry.id,
  approved: 'null',
)
