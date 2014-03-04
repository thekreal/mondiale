class Chapter < ActiveRecord::Base

	belongs_to :trip
	has_many :posts

	validates :title, presence: true
end