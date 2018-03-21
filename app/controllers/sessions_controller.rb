class SessionsController < ApplicationController

  # Make a new session for a user
  def new
    @user = User.new
  end



  # Create new session on login
  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully Logged In!"
      redirect_to @user
    else
      flash[:notice] = "Error!  Incorrect email or password."
      redirect_to login_path
    end
  end

  # Destroy current session on logout
  def destroy
    logout
    flash[:notice] = "Successfully Logged Out!"
    redirect_to root_path
  end

end
