class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true
  validate :end_date_after_start_date

  def end_date_after_start_date
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def total_days
    (end_date - start_date).to_i
  end

  def total_price
    total_days * instrument.price
  end
end
