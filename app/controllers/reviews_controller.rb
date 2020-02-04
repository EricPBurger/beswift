class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def create
    @review.new(review_params)
    @review.booking_id = @booking.id
    if @review.save
      redirect to costume_path(@costume)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
