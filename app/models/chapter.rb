class Chapter < ActiveRecord::Base
	attr_accessor :inspirationinfo

  belongs_to :trip
  has_many :posts, dependent: :delete_all

  acts_as_votable
  acts_as_list scope: :trip


	validates :title, presence: true

	def inspiration
		if inspiration_id != nil
    ActiveModel.const_get(inspiration_type).find(inspiration_id)
  	end
  end
end