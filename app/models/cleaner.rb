class Cleaner < ApplicationRecord
  include PgSearch
  mount_uploader :photo_url, PhotoUrlUploader
  attr_accessor :rating_average
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true
  geocoded_by :address
  # validates :photo_url, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

   pg_search_scope :search_all,
    against: [ :name, :description, :age, :price ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # for js
  def availabilities
    availabilities = {}
    reservations.each do |reservation|
      date_string = reservation.reserved_on.strftime("%d/%m/%Y") # for js
      availabilities[date_string]
      if reservation.reserved_on.hour <= 12
        availabilities[date_string] = 'am'
      else
        availabilities[date_string] = 'pm'
      end
    end
    return availabilities
  end

  # def isAvailable(new_begin_time, new_end_time)
  #   reservations.each do |reservation|
  #     puts "booking:" + new_begin_time.to_s + " " + new_end_time.to_s
  #     puts "checking for:"
  #     puts reservation.reserved_on.to_s
  #     puts reservation.reserved_until.to_s
  #     # raise
  #     # puts "new_begin_time >= reservation.reserved_on) " + (new_begin_time >= reservation.reserved_on).to_s
  #     # puts "new_begin_time < reservation.reserved_until) " + (new_begin_time < reservation.reserved_until).to_s
  #     # puts "new_end_time > reservation.reserved_on) " + (new_end_time > reservation.reserved_on).to_s
  #     # puts "new_end_time <= reservation.reserved_on) " + (new_end_time <= reservation.reserved_on).to_s


  #     if new_begin_time >= reservation.reserved_on && new_begin_time < reservation.reserved_until
  #       return false
  #     elsif new_end_time > reservation.reserved_on && new_end_time <= reservation.reserved_until
  #       return false
  #     end
  #   end
  #   return true
  # end

  def available(test_day)
    am_available = true
    pm_available = true
      reservations.each do |reservation|
       date_string = reservation.reserved_on.strftime("%d/%m/%Y") # for js
       if (date_string == test_day.strftime("%d/%m/%Y"))
         if reservation.reserved_on.hour <= 12
           am_available = false
         else
           pm_available = false
         end
       end
       return { am: am_available, pm: pm_available }
     end
   end
end

