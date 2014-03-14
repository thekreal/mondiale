module InspirationsHelper

  def create_inspiration_link
    return link_to('', inspirations_path(inspiration: { inspirable_id: @chapter, inspirable_type: @chapter.class}),
    method: :post, remote: true, class: "fa fa-heart")
  end

  def destroy_inspiration_link
    return link_to('', @chapter.find_inspiration_by(current_user),
    method: :delete, remote: true, class: "fa fa-heart")
  end

end