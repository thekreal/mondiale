class TripPlan < ActiveRecord::Base

	has_many :plan_items
	belongs_to :user

	geocoded_by :location

	validates :title,  presence: true,
										 uniqueness: true
	validates :description, presence: true

	def add_trip_inspiration(trip)
		posts = trip.posts
		posts.each do |post|
			plan_item = self.plan_items.new(title: trip.title, location: post.location)
			plan_item.save
		end
	end
end