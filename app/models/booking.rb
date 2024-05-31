class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true
  validate :end_date_after_start_date
  validates :instrument, presence: true

  after_create :set_instrument_availability_no
  after_destroy :set_instrument_availability_yes

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def total_days
    return 0 unless start_date && end_date

    (end_date - start_date).to_i
  end

  def total_price
    return 0 unless instrument

    total_days * instrument.price
  end

  private

  def set_instrument_availability_no
    instrument.update(availability: "No")
  end

  def set_instrument_availability_yes
    instrument.update(availability: "Yes")
  end
end
