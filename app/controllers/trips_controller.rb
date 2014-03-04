class TripsController < ApplicationController

  #before_filter :ensure_logged_in, :only => [:edit, :destroy, :new]
  def index
    @trips = Trip.all
  end


  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def show
    @trip = Trip.find(params[:id])

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect to trips_path
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :description, :location_text, :longitude, :latitude)
  end
end
