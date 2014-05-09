class Trip < ActiveRecord::Base
  include Common

	belongs_to :user
	has_many :chapters, dependent: :delete_all
	has_many :posts, through: :chapters
  has_many :post_attachments, through: :posts

  has_many :inspirations, as: :inspirable

  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true

  scope :most_recent, -> { order(created_at: :desc)}

  def number_of_chapters
    chapters.count
  end

  def inspiration
    if inspiration_id != nil
    ActiveModel.const_get(inspiration_type).find(inspiration_id)
    end
  end

  def self.most_inspiring
    all(include: :inspirations).sort_by { |u| -u.inspirations.size }
  end

  def turn_into_trip_plan
    trip_plan = TripPlan.new(title: "My Own " + self.title, description: self.description)
    trip_plan.save
    trip_plan.add_trip_inspiration(self)
  end

end