class PostsController < ApplicationController

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

	def post_params
		params.require(:post).permit(:title, :content, :date, )
	end

end
