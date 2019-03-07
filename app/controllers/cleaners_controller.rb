class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    # if params[:search]
    #   @cleaners = Cleaner.search_all(params[:search])
    # else
      @cleaners = Cleaner.all
    # end

    if current_user&.address
      @cleaners = @cleaners.near(current_user.address, params[:distance])
    end
    @cleaners.each do |cleaner|
      average_calcul cleaner
    end

    cleaners_map = @cleaners.where.not(latitude: nil, longitude: nil)
    @markers = cleaners_map.map do |cleaner|
      {
        lng: cleaner.longitude,
        lat: cleaner.latitude
      }
    end

  end

  def show
    @cleaner = Cleaner.find(params[:id])
    average_calcul @cleaner
    @reviews = []
    reservations = Reservation.where(cleaner_id: params[:id], status:'2') #get all finish rsv of current cleaner
    reservations.each { |rsv| @reviews << Review.find(rsv.id).content  }
    @booking = Reservation.new
  end

  private

  def average_calcul(cleaner)
    sum = 0.0
    cleaner.average_rating = 0.0
    counter = 0
    cleaner.reservations.each do |reservation|
      if !reservation.reviews.empty?
        sum += reservation.reviews.first.rating
        counter += 1
      end
      cleaner.average_rating = (sum / counter).round(1)
    end
  end
end
