class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cleaners = Cleaner.all
    @cleaners.each do |cleaner|
      average_calcul cleaner
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

  def average_calcul cleaner
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
