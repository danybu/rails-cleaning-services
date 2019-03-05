class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cleaners = Cleaner.all
  end

  def show
    @reviews = []
    @cleaner = Cleaner.find(params[:id])
    reservations = Reservation.where(cleaner_id: params[:id], status:'2') #get all finish rsv of current cleaner
    reservations.each { |rsv| @reviews << Review.find(rsv.id).content  }
    @booking = Reservation.new
  end
end
