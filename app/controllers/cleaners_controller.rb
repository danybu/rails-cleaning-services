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
          # raise
          puts "#{cleaner.name} => #{reservation.reviews[0].rating}"
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
    @reviews = ["Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi
     unde magnam voluptates, cumque neque, eveniet quibusdam
     illo dolorum nobis nihil aperiam, eaque sapiente dolorem obcaecati? Ex eos
     qui aut, sunt.","Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi
     unde magnam voluptates, cumque neque, eveniet quibusdam
     illo dolorum nobis nihil aperiam, eaque sapiente dolorem obcaecati? Ex eos
     qui aut, sunt." ,"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi
     unde magnam voluptates, cumque neque, eveniet quibusdam
     illo dolorum nobis nihil aperiam, eaque sapiente dolorem obcaecati? Ex eos
     qui aut, sunt." ]

     @booking = Reservation.new
   end
 end
