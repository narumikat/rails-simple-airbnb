class Booking < ApplicationRecord
  belongs_to :flat

  validates :booked_from, :booked_untill, presence: true
end
