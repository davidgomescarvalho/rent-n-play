class Instrument < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :body ],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 15 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true
  validates :location, presence: true
  validates :availability, presence: true
  validates :user, presence: true

end
