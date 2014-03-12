module Common
  extend ActiveSupport::Concern

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

end