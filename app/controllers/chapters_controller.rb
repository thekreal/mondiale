class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy, :vote]

  def show
    @trip = Trip.find(params[:trip_id])

    @posts = @chapter.posts
    @inspired_by = inspiration_find(@chapter)

    @current_chapter_index = @chapter.position - 1

    if @current_chapter_index > 0
      @prev_chapter = @trip.chapters.order("position")[@current_chapter_index - 1]
    end

    if @current_chapter_index < @trip.chapters.order("position").size - 1
      @next_chapter = @trip.chapters.order("position")[@current_chapter_index + 1]
    end

    cookies.permanent[:last_trip_viewed] = @chapter.trip.id
    cookies.permanent[:last_chapter_viewed] = @chapter.id
  end

	def new
		@trip = Trip.find(params[:trip_id])
    @chapter = Chapter.new( :trip_id => @trip.id )

    respond_to do |format|
      format.html #if ajax is disabled
      format.js #for remote true ajax calls
    end

	end

	def create
		@trip = Trip.find(params[:trip_id])
		@chapter = @trip.chapters.new(chapter_params)
    respond_to do |format|
      if @chapter.save
        format.html do
          flash[:success] = "Your chapter has been created successfully"
          redirect_to @trip
        end
        format.js
      else
        format.html {render :new}
        format.js
      end
    end

	end

  def edit
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @chapters = @trip.chapters.order("position")
    respond_to do |format|

      if @chapter.update(chapter_params)
        format.html do
          flash[:success] = "Your chapter has been updated successfully"
          redirect_to [@chapter.trip, @chapter]
        end
        format.js
      else
        format.html {render :edit}
        format.js
      end
    end
  end

  def destroy
     respond_to do |format|
      if @chapter.destroy
        @trip = Trip.find(params[:trip_id])
        @chapters = @trip.chapters
        format.html do
          flash[:success] = "Your chapter has been deleted successfully"
          redirect_to @chapter.trip
        end
        format.js
      else
        format.html {redirect_to @chapter.trip}
        format.js
      end
    end


  end

private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
  	params.require(:chapter).permit(:title, :description, :inspiration_id)
  end

end