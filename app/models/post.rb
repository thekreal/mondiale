class Post < ActiveRecord::Base

	belongs_to :chapter

	has_many :post_attachments
 	accepts_nested_attributes_for :post_attachments
  mount_uploader :post_image, PostImageUploader


  # returns trip object when type post.trip
  has_one :trip, through: :chapter
  # delegate :trip, to: :chapter


	validates :title,     presence: true
  validates :content,   presence: true
  validates :date,      presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end