class Attendance < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :attendee, class_name: "User"
  belongs_to :event
 
  validates_presence_of :attendee 
  # //:attendee_id -> might be a column entry w/o an attendee

  has_one :starting_location,
    class_name: "Location", 
    foreign_key: "starting_location_id"
end