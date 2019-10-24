class Ticket < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :route
end
