class TripPlansController < ApplicationController

	def new
	end

	def show
	end

private

	def trip_plan_params
    params.require(:trip).permit(:title, :description)
  end

end