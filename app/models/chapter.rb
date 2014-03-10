class Chapter < ActiveRecord::Base
  acts_as_votable

  belongs_to :trip
  has_many :posts, dependent: :delete_all

	validates :title, presence: true

	def inspiration
		if inspiration_id != nil
    ActiveModel.const_get(inspiration_type).find(inspiration_id)
  	end
  end
end