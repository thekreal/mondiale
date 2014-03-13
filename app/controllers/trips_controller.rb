class TripsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :edit, :destroy]
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :vote, :new_cover, :create_cover]

  def index
    if params[:search] && !params[:search].empty?
      @trips = Post.near(params[:search], 1000).order("distance").map(&:trip).uniq
    else
      @trips = Trip.most_inspiring
    end
  end

  def show
    @chapters = @trip.chapters.order("position")
    @chapter = Chapter.new( trip_id: @trip.id )
    @inspired_by = inspiration_find(@trip)

    if @trip.coverphoto
      @cover = PostAttachment.find(@trip.coverphoto)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @trip = current_user.trips.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @trip = current_user.trips.new(trip_params)
    respond_to do |format|
      if @trip.save
        format.html do
          flash[:success] = "Your trip has been created successfully"
          redirect_to @trip
        end
        format.js { trip_path(@trip) }
      else
        format.html { render :new }
        format.js {}
      end
    end
  end

  def new_cover
    respond_to :js
  end

  def create_cover
    @trip.coverphoto = params[:pid]
    if @trip.save
      flash[:success] = "Trip Cover has being successfully set"
      redirect_to @trip
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html {
          flash[:success] = "Your trip has been updated successfully"
          redirect_to @trip
        }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @trip.destroy
    flash[:success] = "Your trip has been removed successfully"
    redirect_to trips_path
  end

  def sort_chapter_items
    params[:chapter].each_with_index do |id, index|
      Chapter.update_all({position: index+1}, {id: id})
    end
  end

private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :description, :inspiration_id)
  end

end