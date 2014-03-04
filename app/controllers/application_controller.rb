class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in."
      redirect_to signin_path
    end
  end

end
