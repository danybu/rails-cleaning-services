class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cleaners = Cleaner.all
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
