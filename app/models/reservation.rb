class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :cleaner
end
