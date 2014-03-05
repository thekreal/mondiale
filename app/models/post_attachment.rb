class PostAttachment < ActiveRecord::Base
	 mount_uploader :postimage, PostImageUploader
   belongs_to :post
end
