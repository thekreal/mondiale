class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :destroy]

	def new
		@chapter = Chapter.find(params[:chapter_id])
		@post = @chapter.posts.new()
   	@post_attachment = @post.post_attachments.build

	end

	def create
		@chapter = Chapter.find(params[:chapter_id])
		@post = @chapter.posts.new(post_params)
		if @post.save
       params[:post_attachments]['post_image'].each do |a|
       	  @post_attachment = @post.post_attachments.create!(:postimage => a, :post_id => @post.id)
       end
			flash[:success] = "Your post has been created successfully"
			redirect_to trip_chapter_path(@post.trip, @post.chapter)
		else
			format.html { render action: 'new' }
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
		params.require(:post).permit(:title, :content, :date, :postimage)
	end

end
