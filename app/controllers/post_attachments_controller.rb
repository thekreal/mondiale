class PostAttachmentsController < ApplicationController

	def destroy
		@post_attachment = PostAttachment.find(params[:id].to_i)
		@post_attachment.delete
	end

end