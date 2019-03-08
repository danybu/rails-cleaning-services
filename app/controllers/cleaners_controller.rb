class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :new, :create]

  def index
    @cleaners = []
    if @cleaners == []
      if params[:search]
        @cleaners = Cleaner.all
        @cleaners = Cleaner.search_all(params[:search]) if params[:search] != ""
      else
        @cleaners = Cleaner.all
      end
    else
      if current_user&.address
        @cleaners = Cleaner.near(current_user.address, 10)
      else
        @cleaners = Cleaner.all
      end
    end


    cleaners_map = @cleaners.where.not(latitude: nil, longitude: nil)
    @markers = cleaners_map.map do |cleaner|
      {
        lng: cleaner.longitude,
        lat: cleaner.latitude
      }
    end

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

  def new
    @cleaner = Cleaner.new
  end

  def create
    @cleaner = Cleaner.create(cleaner_params)
    if @cleaner.save
      redirect_to cleaners_path
    else
      render :new
    end
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

  def cleaner_params
    params.require(:cleaner).permit(:name, :description, :age, :price, :address, :photo_url)
  end

end

