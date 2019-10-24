class Route < ApplicationRecord
	has_many :reservations, dependent: :destroy
	has_many :bookings, dependent: :destroy
	has_many :tickets, dependent: :destroy
	TOTAL_SEATS = 30
	def Route.create_new_routes
		cities = City.pluck(:city_name).compact
		service_no = 1259
		departure_times = ["00:15", "01:00", "02:00", "04:00", "04:20", "18:30", "20:45"]
		durations = (04..10).to_a
		3.times do |n|
			origin, destination = cities.sample(2)
			service_number = "TN-46-#{service_no+=1}"
			service_name = "#{origin[0..2].upcase}-#{destination[0..2].upcase}"
			depart_time = departure_times.sample.to_time
			duration = durations.sample
			arrival_time = depart_time += duration
			route = Route.create(service_num: service_number, service_name: service_name, origin: origin, destination: destination,total_seats: TOTAL_SEATS,  departure_time: depart_time, arrival_time: arrival_time, duration: duration, bording_point: origin, dropping_point: destination)
			start_date = Date.today
			10.times do |n1|
				date = start_date + n1.day
				reservation = route.reservations.create(origin: route.origin, destination: route.destination, total_seats: route.total_seats, boarding_point: route.bording_point, dropping_point: route.dropping_point, duration: route.duration, travel_date: date, departure_time: route.departure_time, arraival_time: arrival_time)
				create_user_bookings(route, reservation)
			end
		end
	end

	def self.create_user_bookings(route, reservation)
		users = User.all
		users.each do |user|
			pnr_num = 10000
			(0..3).to_a.sample.times do |n2|
				pnr = "RV#{pnr_num+=1}"
				seats = ["LSB1","LB1","LB2","LB3","LB4","LB5", "SLB1", "SLB2"," SLB3", "SLB4", "SLB5", "SLB6"," SLB6", "SLB7", "SLB8", "SLB9", "SLB10","UB1","UB2","UB3","UB4","UB5","SUB1","SUB2","SUB3","SUB4","SUB5","SUB6","SUB7","SUB8","SUB9","SUB10"]
				issue_date = ((Date.today-10.days)..Date.today).to_a.sample
    		seat_count = (1..5).to_a.sample
    		booked_seats_count = reservation.bookings.sum(:no_of_seats) + seat_count
    		if booked_seats_count <= route.total_seats
		      booking = user.bookings.create(pnr_no: pnr, issued_date: issue_date, travel_date: reservation.travel_date, issued_by: user.id, origin: route.origin, destination: route.destination, route_id: route.id, reservation_id: reservation.id)
		      base_fare = rand(600..1200)
					gst_per = 5
	    		discount = rand(10..50)
	    		selected_seats = seats.sample(seat_count)
	    		tot_fare = 0
	    		selected_seats.each do |seat|
	  				cancel_amt = 0
	  				refund_amt = 0
	  				can_per = 0
	  				cp = 0
	    			is_can = [true, false].sample
	    			gst_amt = (base_fare*gst_per)/100
			    	net_amt = ((base_fare + gst_amt)-discount)
	    			tot_fare =+ net_amt
	    			if is_can == true
	  					cp = [0,15,30,45,60,75,100].sample
	    				can_per = cp
	    				cancel_amt = (base_fare*can_per)/100
	    				refund_amt = net_amt - cancel_amt
	    			end
			    	ticket = booking.tickets.create(pnr_no: booking.pnr_no,seat_no: seat, base_fare: base_fare, discount: discount, gst_percent: gst_per,gst_amount: gst_amt,net_amount: net_amt, issued_date: issue_date, travel_date: reservation.travel_date,cancel_percent: can_per, canceled_amount: cancel_amt, is_canceled: is_can, refund_amount: refund_amt,route_id: route.id,user_id: user.id,total_amount: booking.total_fare,total_seat:selected_seats.count)
		    	end
		    	booking.update(total_fare: tot_fare, no_of_seats: selected_seats.count)
		    end
	    end
  	end
	end	
end
