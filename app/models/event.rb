class Event < ActiveRecord::Base
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  has_one :location, as: :addressable
  has_many :attendances
  has_many :attendees, through: :attendances, class_name: "User", source: "user"
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :attendances, reject_if: proc { |attr| attr["user_id"].blank? }

  # after_save :create_reminder_jobs

  # def create_reminder_jobs
  #   @event = Event.new
  #   alert_time = @event.start_time - @event.attendances.first.trip_duration - 10.minutes
  #   TimeQueryWorker.perform_at(alert_time, id)
  # end

  def attend()

  end

  # def address_compact
  #   [address, city, postcode].compact.join(", ")
  # end
end
