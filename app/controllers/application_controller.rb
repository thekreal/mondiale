class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def ensure_logged_in
    unless logged_in?
      flash[:alert] = "Please log in."
      redirect_to :signin
    end
  end

  def inspiration_find(obj)
  	if obj.inspiration_id && Inspiration.exists?(obj.inspiration_id)
      inspiration = Inspiration.find(obj.inspiration_id)
      if inspiration.inspired_by
        return inspiration.inspired_by
      else
        inspiration.destroy
        obj.update_attribute(:inspiration_id, nil)
        return false
      end
    elsif !obj.inspiration_id
      return false
    else
      obj.update_attribute(:inspiration_id, nil)
      return false
  	end
  end
  helper_method :inspiration_find

end
