class TripPlansController < ApplicationController

	def index
	end

	def new
	end

private

	def trip_plan_params
    params.require(:trip).permit(:title, :description)
  end

end