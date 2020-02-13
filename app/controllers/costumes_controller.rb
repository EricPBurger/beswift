class CostumesController < ApplicationController

  def index
    @costumes = Costume.all
    @imgs = @costumes.map { |costume| [costume.id, costume.photo.key] }
  end

  def show
    add_breadcrumb "Back to costumes", costumes_path
    @costume = Costume.find(params[:id])
    @booking = Booking.new
    @markers = [{ lng: @costume.user.longitude, lat: @costume.user.latitude }]
  end

  def new
    add_breadcrumb "Back to costumes", :costumes_path
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
    add_breadcrumb "Back to costumes", costumes_path
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
    params.require(:costume).permit(:costume_name, :origin, :price, :size, :photo, :desc_short, :desc_long)
  end
end
