json.extract! ticket, :id, :booking_id, :seat_no, :base_fare, :discount, :gst, :net_amount, :is_canceled, :canceled_amount, :refound_amount, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
