class LibraryUsersController < ApplicationController

  before_action :logged_in?, only: [:create]

  # Index of all libraries a user has joined
  def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries

    render :index
  end

  # Create new association, or 'join'
  def create
    @library = Library.find(params[:library_id])
    @library.users.push(current_user)
    redirect_to current_user
  end

end
