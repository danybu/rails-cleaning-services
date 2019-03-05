class ReviewsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reservation = Reservation.find(params[:reservation_id])
    if @review.save!
      redirect_to reservations_path
    else
      redirect_to reservations_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
