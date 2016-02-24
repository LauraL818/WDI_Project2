class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :correct_user, :correct_entry

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def correct_user
     @correct_user = User.find(params[:id])
     redirect_to user_path(current_user) unless @correct_user == current_user
   end

  def correct_entry
     @correct_entry = Entry.find(params[:id]).user.id
     redirect_to user_path(current_user) unless @correct_entry == current_user.id
   end
end
