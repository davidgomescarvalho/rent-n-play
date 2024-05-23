class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true
end
