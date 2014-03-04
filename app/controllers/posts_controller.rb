class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :destroy]

	def new
		@chapter = Chapter.find(params[:chapter_id])
		@post = @chapter.posts.new()
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Your post has been created successfully"
			redirect_to trip_chapter_path(@post.trip, @post.chapter)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Your post has been updated successfully"
			redirect_to trip_chapter_path(@post.trip, @post.chapter)
		else
			render :edit
		end
	end

	def destroy
		if @post.destroy
			flash[:success] = "Your post has been deleted successfully"
			redirect_to trip_chapter_path(@post.trip, @post.chapter)
		end
	end

private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :date)
	end

end
