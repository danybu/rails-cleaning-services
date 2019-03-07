class Cleaner < ApplicationRecord
  mount_uploader :photo_url, PhotoUrlUploader

  attr_accessor :rating_average
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true
  geocoded_by :address
  # validates :photo_url, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
