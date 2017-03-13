class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  # Display user index
  def index
    @users = User.all
  end

  # Display sign up form
  def new
    @user = User.new
  end

  # Create a new user
  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  # Show a user page
  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  # Defines parameters for 'user'
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
