class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def ensure_logged_in
    unless logged_in?
      flash[:alert] = "Please log in."
      redirect_to :signin
    end
  end

  def inspiration_find(obj)
  	if obj.inspiration_id
    Inspiration.find(obj.inspiration_id).inspired_by
  	end
  end

end
