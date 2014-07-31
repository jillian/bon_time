class Attendance < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  belongs_to :location
end
