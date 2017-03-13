class LibrariesController < ApplicationController
  def index
    @library = Library.all
  end
end
