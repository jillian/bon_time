class Attendance < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  belongs_to :starting_location, class_name: "Location"


  validates_presence_of :attendee, :starting_location_id
  
  # //:attendee_id -> might be a column entry w/o an attendee


end