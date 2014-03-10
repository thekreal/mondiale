class Trip < ActiveRecord::Base

  acts_as_votable

	belongs_to :user
	has_many :chapters, dependent: :delete_all
	has_many :posts, through: :chapters

  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true

  scope :most_recent, -> { order(created_at: :desc)}

  def start_date
    if self.posts.any?
    posts.first.date.to_date.to_formatted_s(:long)
    else
      ""
    end
  end

  def end_date
    if self.posts.any?
    posts.last.date.to_date.to_formatted_s(:long)
    else
      ""
    end
  end

  def number_of_chapters
    chapters.count
  end

  def self.highest_rated
    self.order("cached_votes_total DESC")
  end

  def inspiration
    if inspiration_type == "Trip"
      Trip.find(inspiration_id)
    elsif inspiration_type == "Chapter"
      Chapter.find(inspiration_id)
    elsif inspiration_type == "Post"
      Post.find(inspiration_id).chapter
    end
  end
end





