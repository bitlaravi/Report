class Reservation < ApplicationRecord
  belongs_to :route
  has_many :bookings, dependent: :destroy
end
