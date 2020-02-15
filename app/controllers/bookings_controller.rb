class BookingsController < ApplicationController
  def index
    add_breadcrumb "Back to costumes", :costumes_path
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    add_breadcrumb "Back to bookings", :bookings_path
    @booking = Booking.find_by(user_id: current_user.id, id: params[:id])
    @costume = @booking.costume
    @markers = [{ lng: @costume.user.longitude, lat: @costume.user.latitude }]
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @booking = Booking.new(booking_params)
      @booking.user_id = current_user.id
      @booking.costume_id = Costume.find(params[:costume_id]).id
      if @booking.save
        redirect_to user_bookings_path(current_user.id)
      else
        render :new
      end
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

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
