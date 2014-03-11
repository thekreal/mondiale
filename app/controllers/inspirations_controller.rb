class InspirationsController < ApplicationController

	def create
		@inspiration = current_user.inspirations.new(inspiration_params)
		@inspiration.save
	end

	def destroy
		@inspiration = Inspiration.find(params[:id])
		@inspiration.destroy
	end

end

private

	def inspiration_params
		params.require(:inspiration).permit(:inspirable_id, :inspirable_type)
	end