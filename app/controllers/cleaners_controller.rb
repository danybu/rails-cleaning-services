class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cleaners = Cleaner.all
    @cleaners.each do |cleaner|
      rating_sum = 0.0
      rating_count = 0
      cleaner.reservations.each do |reservation|
        if !reservation.reviews.empty?
          rating_sum += reservation.reviews[0].rating
          rating_count += 1
        end
      end
      if rating_sum == 0
        cleaner.rating_average = 0
      else
        cleaner.rating_average = rating_sum / rating_count
      end
    end
    cleaners_map = Cleaner.where.not(latitude: nil, longitude: nil)
    @markers = cleaners_map.map do |cleaner|
      {
        lng: cleaner.longitude,
        lat: cleaner.latitude
      }
    end
  end

  def show
    @reviews = []
    @cleaner = Cleaner.find(params[:id])
    reservations = Reservation.where(cleaner_id: params[:id], status:'2') #get all finish rsv of current cleaner
    reservations.each { |rsv| @reviews << Review.find(rsv.id).content  }
    @booking = Reservation.new
  end
end
