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
  end

  def show
    @cleaner = Cleaner.find(params[:id])
      rating_sum = 0.0
      rating_count = 0
      @cleaner.reservations.each do |reservation|
        if !reservation.reviews.empty?
          rating_sum += reservation.reviews[0].rating
          rating_count += 1
        end
      if rating_sum == 0
        @cleaner.average_rating = 0
      else
        @cleaner.average_rating = rating_sum / rating_count
      end

    end

    @reviews = []
    reservations = Reservation.where(cleaner_id: params[:id], status:'2') #get all finish rsv of current cleaner
    reservations.each { |rsv| @reviews << Review.find(rsv.id).content  }
    @booking = Reservation.new
  end


  private

  def average_calcul cleaner

  end
end
