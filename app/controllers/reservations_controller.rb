class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user: current_user)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(params[:reservation])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params

    params.require(:reservation).permit(:reserved_on,:user_id,:cleaner_id,:status)

  end
end
