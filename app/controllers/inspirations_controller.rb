class InspirationsController < ApplicationController

	def create
		@inspiration = current_user.inspirations.new(inspiration_params)
		respond_to do |format|
		if @inspiration.save
			format.js
		end
	 end
	end

end

private

	def inspiration_params
		params.require(:inspiration).permit(:inspirable_id, :inspirable_type)
	end