class Booking < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  belongs_to :route
  belongs_to :reservation
end
