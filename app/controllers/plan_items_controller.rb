class PlanItemsController < ApplicationController

	def new
		@trip_plan = TripPlan.find(params[:trip_plan_id])
		@plan_item = PlanItem.new(trip_plan_id: @trip_plan)
	end

	def create
		@trip_plan = TripPlan.find(params[:trip_plan_id])
		@plan_item = @trip_plan.plan_items.new(plan_items_params)
			respond_to do |format|
				if @trip_plan.save
					format.html do
						flash[:success] = "Your post has been created successfully"
						redirect_to @trip_plan
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

	end

	def destroy
		@trip_plan = TripPlan.find(params[:trip_plan_id])
		@plan_item = PlanItem.find(params[:id])
		@plan_items = @trip_plan.plan_items
		respond_to do |format|
			if @plan_item.destroy
				format.html do
					flash[:success] = "This itinerary item has been deleted successfully"
					redirect_to @trip_plan
				end
				format.js
			else
				format.html
				format.js
			end
		end
	end

private

	def plan_items_params
		params.require(:plan_item).permit(:title, :date, :location)
	end

end