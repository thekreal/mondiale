class SessionsController < ApplicationController

  def new
  end

  def create
    respond_to do |format|
      if user = login(params[:session][:email], params[:session][:password], params[:session][:remember])
        flash[:success] = "You are now logged in"
        format.html { redirect_back_or_to(user) }
      else
        flash.now[:danger] = "Invalid email / password combination"
        format.html { render :new }
      end
    end
  end

  def destroy
    logout
    flash[:success] = "You are now logged out"
    redirect_to root_path
  end

end