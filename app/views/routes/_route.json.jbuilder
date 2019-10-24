json.extract! route, :id, :service_name, :service_num, :origin, :destination, :total_seats, :duration, :bording_point, :dropping_point, :created_at, :updated_at
json.url route_url(route, format: :json)
