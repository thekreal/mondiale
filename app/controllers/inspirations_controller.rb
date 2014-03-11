class InspirationsController < ApplicationController

	def create
		@inspiration = current_user.inspirations.new(inspiration_params)
		@inspiration.save
	end

end

private

	def inspiration_params
		params.require(:inspiration).permit(:inspirable_id, :inspirable_type)
	end