class ChaptersController < ApplicationController

  def show
    @chapter = Chapter.find(params[:id])
    @posts = @chapter.posts
    @trip = @chapter.trip
  end

	def new
		@trip = Trip.find(params[:trip_id])
		@chapter = Chapter.new
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@chapter = @trip.chapters.new(chapter_params)
		if @trip.save
      flash[:success] = "Your chapter has been created successfully"
      redirect_to @trip
    else
      render :new
    end
	end

  def edit
  end

  def update
  end

  def destroy
  end

private

def chapter_params
	params.require(:chapter).permit(:title, :location, :longitude, :latitude, :start_date, :end_date )
end

end