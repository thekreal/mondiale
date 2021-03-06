class PlanItem < ActiveRecord::Base

	belongs_to :trip_plan

	geocoded_by :location
	after_validation :geocode, if: :location_changed?

	scope :trip_order, -> {order(date: :asc)}

end