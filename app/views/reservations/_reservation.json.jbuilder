json.extract! reservation, :id, :route_id, :origin, :destination, :departure_time, :duration, :boarding_point, :dropping_point, :travel_date, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
