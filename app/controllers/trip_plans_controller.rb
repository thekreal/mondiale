class TripPlansController < ApplicationController

	def new
		@trip_plan = current_user.trip_plans.new
    respond_to do |format|
      format.html
      format.js
    end
	end

	def show
	end

private

	def trip_plan_params
    params.require(:trip).permit(:title, :description)
  end

end