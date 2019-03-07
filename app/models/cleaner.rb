class Cleaner < ApplicationRecord

  attr_accessor :rating_average
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def isAvailable(new_begin_time, new_end_time)
    reservations.each do |reservation|
      puts "booking:" + new_begin_time.to_s + " " + new_end_time.to_s
      puts "checking for:"
      puts reservation.reserved_on.to_s
      puts reservation.reserved_until.to_s
      # raise
      # puts "new_begin_time >= reservation.reserved_on) " + (new_begin_time >= reservation.reserved_on).to_s
      # puts "new_begin_time < reservation.reserved_until) " + (new_begin_time < reservation.reserved_until).to_s
      # puts "new_end_time > reservation.reserved_on) " + (new_end_time > reservation.reserved_on).to_s
      # puts "new_end_time <= reservation.reserved_on) " + (new_end_time <= reservation.reserved_on).to_s

      if new_begin_time >= reservation.reserved_on && new_begin_time < reservation.reserved_until
        return false
      elsif new_end_time > reservation.reserved_on && new_end_time <= reservation.reserved_until
        return false
      end
    end
    return true
  end

end

