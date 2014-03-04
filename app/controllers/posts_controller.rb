class PostsController < ApplicationController

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
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:success] = "Your post has been updated successfully"
			redirect_to trip_chapter_path(@post.trip, @post.chapter)
		else
			render :edit
		end
	end

	def destroy
	end

private

	def post_params
		params.require(:post).permit(:title, :content, :date, :chapter_id )
	end

end
