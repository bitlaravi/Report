class City < ApplicationRecord
	def City.load_cities
		["Bangalore", "Chennai", "Hyderabad", "Coiambathur", "Tiruvanandhapuram", "Cochin", "Mysore", "Salem","New Delhi", "Jarkand", "Kolkata", "Madhya Pradhesh", "Ahamadhabad", "Tirupathy", "Noyda","Pune", "Ariyalur", "Trichy", "Mumbai"].each do |city|
			City.create(city_name: city)
		end
	end
end
