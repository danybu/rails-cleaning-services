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
    am = (reservation_params["before_noon"] == "true")
    pm = (reservation_params["after_noon"] == "true")
    reserved_until = DateTime.parse reservation_params[:reserved_on]
    reserved_on = DateTime.parse reservation_params[:reserved_on]
    if am
      reserved_on = reserved_on.change(hour: 8, min: 0, sec: 0 )
    else
      reserved_on = reserved_on.change( hour: 13, min: 0, sec: 0 )
    end
    if pm
      reserved_until = reserved_until.change({ hour: 12, min: 0, sec: 0 })
    else
      reserved_until = reserved_until.change({ hour: 18, min: 0, sec: 0 })
    end
    result_params = reservation_params
    result_params[:reserved_on] = reserved_on
    result_params[:reserved_until] = reserved_until

    @reservation = Reservation.create!(result_params.except(:before_noon, :after_noon))
    if @reservation.save
      redirect_to reservations_path
    else
      render :show
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(params[:reservation])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserved_on, :reserved_until, :user_id, :cleaner_id, :status, :before_noon, :after_noon)
  end
end
