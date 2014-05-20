class TripPlansController < ApplicationController

	before_action :set_trip_plan, only: [:show, :destroy]

	def new
		@trip_plan = current_user.trip_plans.new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@trip_plan = current_user.trip_plans.new(trip_plan_params)
		respond_to do |format|
			if @trip_plan.save
				format.html do
				flash[:success] = "Your trip plan has been created successfully"
	      redirect_to @trip_plan
	    	end
	    	format.js { trip_plan_path(@trip_plan) }
	    else
	    	format.html { render :new }
	      format.js {}
	    end
		end
	end

	def show
		@trip_plan = TripPlan.find(params[:id])
		@plan_items = @trip_plan.plan_items.trip_order
	end

	def destroy
		@trip_plan.destroy
		flash[:success] = "Your trip plan has been removed successfully"
		redirect_to my_trip_plans_user_path(current_user)
	end

private

	def set_trip_plan
		@trip_plan = TripPlan.find(params[:id])
	end

	def trip_plan_params
    params.require(:trip_plan).permit(:title, :description)
  end

end