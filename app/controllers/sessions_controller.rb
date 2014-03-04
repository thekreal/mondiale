class SessionsController < ApplicationController

  def new
  end

  def create
    if user = login(params[:session][:email], params[:session][:password], params[:session][:remember])
      flash[:success] = "You are now logged in"
      redirect_back_or_to(user)
    else
      flash.now[:danger] = "Invalid email / password combination"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "You are now logged out"
    redirect_to root_path
  end

end