class ReviewsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reservation = Reservation.find(params[:reservation_id])
    if @review.save!
      redirect_to cleaner_path(@review.reservation.cleaner)
    else
      redirect_to cleaner_path(@review.reservation.cleaner)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
