class LibrariesController < ApplicationController

  before_action :set_library, only: [:show, :update, :destroy, :edit]

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
    set_library
  end

  private

  # Define parameters for 'library'
  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

  def set_library
    @library = Library.find(params[:id])
  end

end
