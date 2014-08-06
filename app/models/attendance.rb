class Attendance < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :attendee, class_name: "User"
  belongs_to :event
 
  has_one :starting_location,
    class_name: "Location", 
    foreign_key: "starting_location_id"
end