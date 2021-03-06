class Driver < ApplicationRecord
  #belongs_to :user
  validates :name, :license_type, :years_driving, :transmission, :location, :price, presence: true
  has_one_attached :photo
  has_many :bookings
  # belongs_to :user

  # [...]
  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
