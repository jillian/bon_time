json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :user_id, :event_id, :location_id
  json.url attendance_url(attendance, format: :json)
end
