class Chapter < ActiveRecord::Base

  belongs_to :trip
  has_many :posts, dependent: :delete_all
  has_many :inspirations, as: :inspirable

  acts_as_list scope: :trip


	validates :title, presence: true

  def already_inspired(user_id)
    inspirations.find_by(user_id: user_id)
  end

  def already_inspired?(user_id)
    already_inspired(user_id).is_a?(Inspiration)
  end

end