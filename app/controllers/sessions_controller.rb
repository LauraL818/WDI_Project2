class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({email: params[:email]})
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.first_name} it's good to see you today!"
      redirect_to user_path @user
    else
      redirect_to new_session_path
      flash[:failure] = "Please try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
