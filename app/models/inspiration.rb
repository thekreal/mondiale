class Inspiration < ActiveRecord::Base
	belongs_to :user
	belongs_to :inspirable, polymorphic: true

	def self.by_this(user_id, obj_id, obj_type)
		where(user_id: user_id, inspirable_id: obj_id, inspirable_type: obj_type)
	end

	def self.by_this?(user_id, obj_id, obj_type)
		where(user_id: user_id, inspirable_id: obj_id, inspirable_type: obj_type).exists?
	end

	def inspired_by
		return ActiveModel.const_get(inspirable_type).find(inspirable_id)
	end

	def number_of_inspired
		inspired_by.inspirations.count
	end

end