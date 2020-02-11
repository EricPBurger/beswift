  class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
    # raise
    @booking = Booking.new
    # @costume.user.geocoded
    @markers = [{ lng: @costume.user.longitude, lat: @costume.user.latitude }]

    # @marker = @address.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new
    end
  end

  def edit
    @costume = Costume.find(params[:id])
  end

  def update
    @costume = Costume.find(params[:id])
    if @costume.update(costume_params)
      redirect_to costume_path(@costume)
    else
      render :new
    end
  end

  private

  def costume_params
    params.require(:costume).permit(:costume_name, :origin, :price, :size, :photo)
  end
end
