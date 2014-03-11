class Chapter < ActiveRecord::Base
	attr_accessor :inspirationinfo
  acts_as_votable
  acts_as_list

  belongs_to :trip
  has_many :posts, dependent: :delete_all
  has_many :inspirations, as: :inspirable

	validates :title, presence: true

  def already_inspired(user_id)
    inspirations.find_by(user_id: user_id)
  end

  def already_inspired?(user_id)
    already_inspired(user_id).is_a?(Inspiration)
  end

end