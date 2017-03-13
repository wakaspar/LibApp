class ApplicationController < ActionController::Base

  # Protects from forgery
  protect_from_forgery with: :exception

  # includes session helper methods for use in application
  include SessionsHelper

end
