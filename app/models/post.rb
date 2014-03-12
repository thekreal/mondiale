class Post < ActiveRecord::Base

  mount_uploader :postimage, PostImageUploader

	belongs_to :chapter

	has_many :post_attachments, dependent: :delete_all
  has_many :inspirations, as: :inspirable
 	accepts_nested_attributes_for :post_attachments

  has_one :trip, through: :chapter

	validates :title,     presence: true
  validates :content,   presence: true
  validates :date,      presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def trip_id
    trip.id
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

  def cover_photo
    if post_attachments.any?
      post_attachments[rand(post_attachments.size)].postimage_url
    else
      'bridge.jpg'
    end
  end

end