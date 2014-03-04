class Post < ActiveRecord::Base

	belongs_to :chapter

  # returns trip object when type post.trip
  delegate :trip, to: :chapter

	validates :title,     presence: true
  validates :content,   presence: true
  validates :date,      presence: true

end