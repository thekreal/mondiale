class Chapter < ActiveRecord::Base

  belongs_to :trip
  has_many :posts, dependent: :delete_all
  has_many :post_attachments, through: :posts
  has_many :inspirations, as: :inspirable

  acts_as_list scope: :trip


	validates :title, presence: true

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

  def start_date
    return posts.any? ? posts.first.date.to_date.to_formatted_s(:long) : ""
  end

  def end_date
    return posts.any? ? posts.last.date.to_date.to_formatted_s(:long) : ""
  end

end