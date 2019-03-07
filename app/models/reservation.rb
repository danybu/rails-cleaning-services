class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cleaner
  has_many :reviews, dependent: :destroy
  validates :reserved_on, presence: true
  validates :reserved_until, presence: true
  validate :reserved_until_after_reserved_on


  private

  def reserved_until_after_reserved_on
    errors.add(:reserved_until, "come on, man, put in a valid reservation period") if :reserved_until <= :reserved_on
  end
end
