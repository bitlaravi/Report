json.extract! booking, :id, :user_id, :booking_id_no, :pnr_no, :origin, :destination, :issued_date, :travel_date, :issued_by, :is_canceled, :route, :total_fare, :created_at, :updated_at
json.url booking_url(booking, format: :json)
