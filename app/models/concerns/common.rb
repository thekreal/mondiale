module Common
  extend ActiveSupport::Concern

  def find_inspiration_by(obj)
    type_id = (obj.class.to_s.downcase << "_id").to_sym
    inspirations.find_by(type_id => obj.id)
  end

  def already_inspired(user_id)
    inspirations.find_by(user_id: user_id)
  end

  def already_inspired?(user_id)
    already_inspired(user_id).is_a?(Inspiration)
  end

  def start_date
    return posts.any? ? posts.first.date.to_date.to_formatted_s(:long) : ""
  end

  def end_date
    return posts.any? ? posts.last.date.to_date.to_formatted_s(:long) : ""
  end

  def cover_photo
    if post_attachments.any?
      post_attachments[rand(post_attachments.size)].postimage_url
    else
      'bridge.jpg'
    end
  end

end