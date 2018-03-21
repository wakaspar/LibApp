module SessionsHelper
  # login by user id
  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # checks if a user is logged in or not
  def logged_in?
    if current_user == nil
      redirect_to root_path
    end
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
