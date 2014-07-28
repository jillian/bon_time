class Location < ActiveRecord::Base
  # include GoogleMaps
  belongs_to :addressable, polymorphic: true

  geocoded_by :address
  after_validation :geocode#, :if => address_changed?
  # validates :address, presence: true

  def coords
    "#{latitude} #{longitude}"
  end

  def location_compact
    "#{address} #{city} #{postcode}"
  end
end
