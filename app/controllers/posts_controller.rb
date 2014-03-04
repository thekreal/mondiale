class PostsController < ApplicationController

	def new
		@chapter = Chapter.find(params[:chapter_id])
		@post = @chapter.posts.new()
	end

	def create

		@post = Post.new(post_params)
		# @post.chapter_id = @chapter
		if @post.save
			flash[:success] = "Your post has been created successfully"
			redirect_to trip_chapter_path(@post.chapter.trip, @post.chapter)
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

private

	def post_params
		params.require(:post).permit(:title, :content, :date, :chapter_id )
	end

end
