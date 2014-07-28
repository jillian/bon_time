class Attendance < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  belongs_to :location
end
