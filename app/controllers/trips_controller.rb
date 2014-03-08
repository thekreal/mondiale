class TripsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :edit, :destroy]
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :vote]

  def index
    if params[:search] && !params[:search].empty?
      @trips = Post.near(params[:search], 1000).order("distance").map(&:trip).uniq
    else
      @trips = Trip.all
    end
  end

  def show
    @chapters = @trip.chapters
    if @trip.coverphoto
      @cover = PostAttachment.find(@trip.coverphoto)
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def vote

    if params[:unvote]
      @trip.unliked_by(current_user)
    else
      @trip.liked_by(current_user)
    end
    respond_to do |format|
      format.html {redirect_to @trip}
      format.js
    end

  end

  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      flash[:success] = "Your trip has been created successfully"
      redirect_to @trip
    else
      render :new
    end
  end

  def set_photo
    set_trip
    respond_to do |format|
      format.js   # show_rec_horses.js.erb
    end
  end

  def set_photo_save
    set_trip
    @trip.coverphoto = params[:pid]
    if @trip.save
      flash[:success] = "Cover photo set"
      redirect_to @trip
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      flash[:success] = "Your trip has been updated successfully"
      redirect_to @trip
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    flash[:success] = "Your trip has been removed successfully"
    redirect_to trips_path
  end

private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :description, :location_text, :longitude, :latitude)
  end

end