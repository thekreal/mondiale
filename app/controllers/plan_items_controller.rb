class PlanItemsController < ApplicationController

	def new
		@trip_plan = TripPlan.find(params[:trip_plan_id])
		@plan_item = PlanItem.new(trip_plan_id: @trip_plan)
	end

	def create

	end

	def edit

	end

	def update

	end

	def destroy

	end

private

	def plan_items_params
		params.require(:plan_item).permit(:title, :date, :location)
	end

end