class ChaptersController < ApplicationController


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

	def show
		@chapter = Chapter.find(params[:id])
		@post = @chapter.posts
		@trip = @chapter.trip
	end

private

def chapter_params
	params.require(:chapter).permit(:title, :location, :longitude, :latitude, :start_date, :end_date )
end

end