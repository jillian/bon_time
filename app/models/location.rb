class Location < ActiveRecord::Base
  # include GoogleMaps
  belongs_to :addressable, polymorphic: true
  has_many :starting_attendances, class_name: "Attendance", foreign_key: 'starting_location_id'
  #class level method that takes those arguments and sets it all up for you

  geocoded_by :full_address
  after_validation :geocode#, :if => address_changed?
  # validates :address, presence: true
  #

  def coords
    "#{latitude} #{longitude}"
  end

  def full_address
    "#{address}, #{city}, #{postcode}"
  end
end
