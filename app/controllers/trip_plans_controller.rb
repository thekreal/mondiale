class TripPlansController < ApplicationController

	def new
		@trip_plan = current_user.trip_plans.new
	end

	def create
		@trip_plan = current_user.trips.new(trip_plan_params)
		if @trip_plan.save
			flash[:success] = "Your trip has been created successfully"
      redirect_to @trip_plan
    end
	end

	def show
		@trip_plan = TripPlan.find(params[:id])
	end

private

	def trip_plan_params
    params.require(:trip).permit(:title, :description)
  end

end