class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find_by(user_id: current_user.id, id: params[:id])
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.costume_id = Costume.find(params[:costume_id]).id
    if @booking.save
      redirect_to user_bookings_path(current_user.id)
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
