class Post < ActiveRecord::Base

	belongs_to :chapter
  delegate :trip, to: :chapter

	validates :title, presence: true

end