class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true
  belongs_to :user
  belongs_to :instrument
end
