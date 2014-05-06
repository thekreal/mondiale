class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :edit, :create]

  def index
    @users = User.all
  end

  def show
    @trips = @user.trips
  end

  def my_trips
    @trips = @user.trips
  end

  def my_trip_plans
    @trip_plans = @user.trip_plans
  end

  def inspiration_list
    @trips = @user.inspiration_models("Trip")
    @chapters = @user.inspiration_models("Chapter")
    @posts = @user.inspiration_models("Post")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = "Account has been successfully created"
      auto_login(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      login(params[:user][:email], params[:user][:password])
      flash[:success] = "Account has been successfully updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "Account has been removed successfully"
      redirect_to users_path
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
  end

end