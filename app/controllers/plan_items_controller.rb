class PlanItemsController < ApplicationController

	def new

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