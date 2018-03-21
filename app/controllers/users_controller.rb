class UsersController < ApplicationController

  before_action :logged_in?, only: [:show, :edit]
  before_action :set_user, only: [:show, :edit, :destroy, :update]

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
    login(@user)
    redirect_to @user
  end

  # Show a user page
  def show
    render :show
  end

  def edit
    # sends edit form
  end

  def update
    @user = User.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.destroy(@user)
    redirect_to new_user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Defines parameters for 'user'
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
