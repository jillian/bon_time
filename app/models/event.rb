class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :attendances
  has_many :attendees, 
    through: :attendances, 
    class_name: "User", 
    foreign_key: "attendee_id"
  belongs_to :location
  
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :attendances, reject_if: proc { |attr| attr["user_id"].blank? }
  accepts_nested_attributes_for :attendees

  # after_save :create_reminder_jobs

  # def create_reminder_jobs
  #   @event = Event.new
  #   alert_time = @event.start_time - @event.attendances.first.trip_duration - 10.minutes
  #   TimeQueryWorker.perform_at(alert_time, id)
  # end

  # def address_compact
  #   [address, city, postcode].compact.join(", ")
  # end
end
