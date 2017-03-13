class LibrariesController < ApplicationController

  # Display all libraries
  def index
    @libraries = Library.all
  end

  # Display new library form
  def new
    @library = Library.new
  end

  # Create a new library
  def create
    @library = Library.create(library_params)
    redirect_to libraries_path
  end

  # Show a library page
  def show
    @library = Library.find_by_id(params[:id])
  end

  private

  # Define parameters for 'library'
  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end
end
