class TripPlan < ActiveRecord::Base

	has_many :plan_items
	belongs_to :user

	validates :title,  presence: true,
										 uniqueness: true
	validates :description, presence: true
end