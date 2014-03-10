class Post < ActiveRecord::Base

  acts_as_votable

  mount_uploader :postimage, PostImageUploader

	belongs_to :chapter

	has_many :post_attachments, dependent: :delete_all
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

end