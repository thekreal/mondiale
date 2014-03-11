class Trip < ActiveRecord::Base
  attr_accessor :inspiration_info
  acts_as_votable

	belongs_to :user
	has_many :chapters, dependent: :delete_all
	has_many :posts, through: :chapters
  has_many :inspirations, as: :inspirable

  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true

  scope :most_recent, -> { order(created_at: :desc)}
  scope :highest_rated, -> { order("cached_votes_total DESC") }

  def trip_cover
    return coverphoto.nil? ? 'default_cover.jpg' : coverphoto
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
end





