json.array!(@events) do |event|
  json.extract! event, :id, :address, :city, :zipcode, :latitude, :longitude, :date, :time, :user_id
  json.url event_url(event, format: :json)
end
