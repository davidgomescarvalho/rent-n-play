class Instrument < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 15 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  has_many :bookings
end
