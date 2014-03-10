class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy, :vote]

  def show
    @posts = @chapter.posts
    @trip = @chapter.trip

    cookies.permanent[:last_trip_viewed] = @chapter.trip.id
    cookies.permanent[:last_chapter_viewed] = @chapter.id
  end

	def new
		@trip = Trip.find(params[:trip_id])
		@chapter = @trip.chapters.new
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@chapter = @trip.chapters.new(chapter_params)
    @chapter.inspiration_type = params[:chapter][:inspirationinfo].split(' ')[0]
    @chapter.inspiration_id = params[:chapter][:inspirationinfo].split(' ')[1]

		if @trip.save
      flash[:success] = "Your chapter has been created successfully"
      redirect_to [@chapter.trip, @chapter]
    else
      render :new
    end
	end

  def vote

    if params[:unvote]
      @chapter.unliked_by(current_user)
    else
      @chapter.liked_by(current_user)
    end
    respond_to do |format|
      format.html {redirect_to @trip}
      format.js
    end

  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      flash[:success] = "Your chapter has been updated successfully"
      redirect_to [@chapter.trip, @chapter]
    else
      render :edit
    end
  end

  def destroy
    if @chapter.destroy
      flash[:success] = "Your chapter has been deleted successfully"
      redirect_to @chapter.trip
    end
  end

private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
  	params.require(:chapter).permit(:title, :description, :inspirationinfo, :inspiration_id, :inspiration_type)
  end

end