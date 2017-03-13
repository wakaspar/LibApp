class LibraryUsersController < ApplicationController

  # Index of all libraries a user has joined
  def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries
  end

  # Create new association, or 'join'
  def create
    @library = Library.find(params[:library_id])
    @library.users.push(current_user)
    redirect_to current_user
  end

end
