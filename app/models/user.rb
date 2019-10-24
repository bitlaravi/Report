class User < ApplicationRecord
	has_many :bookings, dependent: :destroy
	has_many :tickets, dependent: :destroy
	before_save :set_email
	def set_email
		email = "#{first_name}@gmail.com"
	end
	def User.create_users
		emp_id = 12458
		fir_names = ["Ravichandran", "Muthukrishnan", "Saravanan", "Prabu", "sreejith",]
		name2 = "dev"
		r = ["Admin","Manager", "Branch Manager", "Booking_officer", "Founder"]
		fir_names.each do |username|
			emp = "EMP-#{emp_id +=1}"
			f_name = username
			e_id = "#{f_name}@gmail.com"
			emp_role = r.sample
			user  = User.create(user_emp_id: emp, first_name: f_name, last_name: name2, email: e_id, role: emp_role )
		end
	end

end