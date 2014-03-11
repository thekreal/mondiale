class Inspiration < ActiveRecord::Base
	belongs_to :user
	belongs_to :inspirable, polymorphic: true


end