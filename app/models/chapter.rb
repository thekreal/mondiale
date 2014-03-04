class Chapter < ActiveRecord::Base

	belongs_to :trip
	has_many :posts, dependent: :delete_all

	validates :title, presence: true
end