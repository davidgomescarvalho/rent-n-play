class Instrument < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 15 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  validates :availability, presence: true
end
