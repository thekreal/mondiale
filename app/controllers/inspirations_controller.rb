class InspirationsController < ApplicationController

	def create
		@inspiration = current_user.inspirations.new(inspiration_params)
		@inspiration.save
		respond_to :js
	end

	def destroy
		@inspiration = Inspiration.find(params[:id])
		@inspiration.destroy
		respond_to :js
	end

private

	def inspiration_params
		params.require(:inspiration).permit(:inspirable_id, :inspirable_type)
	end

end