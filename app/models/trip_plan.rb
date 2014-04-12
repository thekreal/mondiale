class TripPlan < ActiveRecord::Base

	has_many :plan_items
	belongs_to :user
end