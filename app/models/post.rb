class Post < ActiveRecord::Base

	belongs_to :chapter

  # returns trip object when type post.trip
  # has_one :trip, through: :chapter
  delegate :trip, to: :chapter


	validates :title,     presence: true
  validates :content,   presence: true
  validates :date,      presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end