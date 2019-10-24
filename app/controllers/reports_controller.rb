class ReportsController < ApplicationController


	def index
		
	end
	def search
		if params[:from_date].to_date.present? && params[:to_date].to_date.present?
			if params[:date_select].present? 
				if params[:from_date].to_date <= params[:to_date].to_date.to_date&& params[:to_date].to_date >= params[:from_date].to_date
					if params[:date_select] == 'Issued Date'
						@tickets = Ticket.joins(:route, :user).select("sum(total_amount-refund_amount) as net_amount,sum(refund_amount) as refund_amount,pnr_no,routes.service_name,group_concat(distinct first_name, ' ',last_name) as full_name,GROUP_CONCAT(tickets.seat_no) as seat_no,tickets.issued_date as issued_date,tickets.travel_date as travel_date,cancel_percent,sum(canceled_amount) as canceled_amount,sum(total_amount) as total_amount,total_seat,gst_amount,base_fare,discount, group_concat(if(is_canceled=true,seat_no, '')) as c_seat, group_concat(seat_no) as b_seat").where("tickets.issued_date between ? and ?", params[:from_date], params[:to_date]).group(:booking_id)	
						
					elsif params[:date_select] == 'Travel Date'
						@tickets = Ticket.joins(:route, :user).select("sum(total_amount-refund_amount) as net_amount,sum(refund_amount) as refund_amount,pnr_no,routes.service_name,group_concat(distinct first_name, ' ',last_name) as full_name,GROUP_CONCAT(tickets.seat_no) as seat_no,tickets.travel_date as to_date,tickets.issued_date as issued_date,cancel_percent,sum(canceled_amount) as canceled_amount,sum(total_amount) as total_amount,total_seat,gst_amount,base_fare,discount, group_concat(if(is_canceled=true,seat_no, '')) as c_seat, group_concat(if(is_canceled=false,seat_no, '')) as b_seat").where("tickets.travel_date between ? and ?", params[:from_date], params[:to_date]).group(:booking_id)
			    end
			    @tickets = @tickets.paginate(page: params[:page], per_page: 10)
					respond_to do |format|
		       format.js
		    	end
			  else
					return flash.now[:error] = "'From Date must be lower then To Date.'"
				end
			else
				return flash.now[:error] = "'Please Select The Date Selector '"
			end
		else
			return flash.now[:error] = "'Please Select The Date  '"
		end
	end
end
