class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
      flash[:success] = "Welcome! Please login to access your account."
    else
      redirect_to new_user_path
      flash[:failure] = "Email already taken please try again"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id] = nil
    if @user.destroy
      redirect_to new_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :favorite, :avatar, :password)
  end
end
