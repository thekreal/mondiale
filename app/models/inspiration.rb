class Inspiration < ActiveRecord::Base
	belongs_to :user
	belongs_to :inspirable, polymorphic: true

	def self.by_this(user_id, obj_id, obj_type)
		where(user_id: user_id, inspirable_id: obj_id, inspirable_type: obj_type)
	end

	def self.by_this?(user_id, obj_id, obj_type)
		where(user_id: user_id, inspirable_id: obj_id, inspirable_type: obj_type).exists?
	end

end