class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    @booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      redirect to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @costume = Costume.find(params[:costume_id])
    @booking = bookings.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
