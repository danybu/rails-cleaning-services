class Cleaner < ApplicationRecord
  include PgSearch
  attr_accessor :rating_average
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

   pg_search_scope :search_all,
    against: [ :name, :description, :age, :price ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
