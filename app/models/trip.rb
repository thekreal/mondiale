class Trip < ActiveRecord::Base

	belongs_to :user
	has_many :chapters
	has_many :posts, through: :chapters

  validates :title, :description, presence: true
  validates :title, uniqueness: true

  def start_date
    chapters.first.posts.first.date.to_date.to_formatted_s(:long)
  end

  def end_date
    chapters.last.posts.last.date.to_formatted_s(:long)
  end

end