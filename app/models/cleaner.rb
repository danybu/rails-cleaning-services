class Cleaner < ApplicationRecord
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true
end
