class Post < ActiveRecord::Base
  mount_uploader :postimage, PostImageUploader

	belongs_to :chapter

	has_many :post_attachments, dependent: :delete_all
 	accepts_nested_attributes_for :post_attachments

  has_one :trip, through: :chapter

	validates :title,     presence: true
  validates :content,   presence: true
  validates :date,      presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

end