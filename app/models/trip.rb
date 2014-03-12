class Trip < ActiveRecord::Base

	belongs_to :user
	has_many :chapters, dependent: :delete_all
	has_many :posts, through: :chapters
  has_many :inspirations, as: :inspirable

  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true

  scope :most_recent, -> { order(created_at: :desc)}

  def cover_photo
    return coverphoto.nil? ? 'bridge.jpg' : coverphoto
  end

  def start_date
    return posts.any? ? posts.first.date.to_date.to_formatted_s(:long) : ""
  end

  def end_date
    return posts.any? ? posts.last.date.to_date.to_formatted_s(:long) : ""
  end

  def number_of_chapters
    chapters.count
  end

  def inspiration
    if inspiration_id != nil
    ActiveModel.const_get(inspiration_type).find(inspiration_id)
    end
  end

  def already_inspired(user_id)
    inspirations.find_by(user_id: user_id)
  end

  def already_inspired?(user_id)
    already_inspired(user_id).is_a?(Inspiration)
  end

end





