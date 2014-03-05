class PostAttachment < ActiveRecord::Base
	 mount_uploader :post_image, PostImageUploader
   belongs_to :post
end
