class SessionsController < ApplicationController

  def new
  end

  def create
    respond_to do |format|
      if user = login(params[:session][:email], params[:session][:password], params[:session][:remember])
        flash[:success] = "You are now logged in"
        format.html { redirect_back_or_to(user) }
        format.js {}
      else
        flash.now[:danger] = "Invalid email / password combination"
        format.html { render :new }
        format.js {}
      end
    end
  end

  def destroy
    cookies.delete :last_trip_viewed
    cookies.delete :last_chapter_viewed
    logout
    flash[:success] = "You are now logged out"
    redirect_to root_path
  end

end