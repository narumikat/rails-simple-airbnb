class Flat < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
