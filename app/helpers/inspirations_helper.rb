module InspirationsHelper

  def create_inspiration_link(obj)
    return link_to('', inspirations_path(inspiration: { inspirable_id: obj, inspirable_type: obj.class}),
    method: :post, remote: true, class: "fa fa-heart page-inspiration")
  end

  def destroy_inspiration_link(obj)
    return link_to('', obj.find_inspiration_by(current_user),
    method: :delete, remote: true, class: "fa fa-heart page-inspiration inspired")
  end

end