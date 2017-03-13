module SessionsHelper
  # login by user id
  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # checks if a user is logged in or not
  def logged_in?
    @current_user = session[:user_id] = nil
    redirect_to new_session_path
  end

  # validates current user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # logs current user out
  def logout
    @current_user = session[:user_id] = nil
  end

end
