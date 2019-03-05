class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cleaner
  has_many :reviews
end
