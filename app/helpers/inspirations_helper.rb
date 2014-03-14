module InspirationsHelper

	def generate_id(obj)
		return "inspiration-#{obj.class.to_s.downcase}#{obj.id}"
	end

  def create_inspiration_link(obj)
    return link_to('', inspirations_path(inspiration: { inspirable_id: obj, inspirable_type: obj.class}),
    method: :post, remote: true, class: "fa fa-heart", id: generate_id(obj) )
  end

  def destroy_inspiration_link(obj)
    return link_to('', obj.find_inspiration_by(current_user),
    method: :delete, remote: true, class: "fa fa-heart inspired", id: generate_id(obj))
  end

end