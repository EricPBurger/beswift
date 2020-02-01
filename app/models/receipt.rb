class Receipt < ApplicationRecord
  belongs_to :booking
  validates :payment_date, :amount, :days_booked, presence: true
end
