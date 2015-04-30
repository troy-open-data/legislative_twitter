module API
  # Base controller class for all versions of the API
  class BaseController < ApplicationController
    abstract!
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

    before_action :authenticate_admin!, only: []
  end
end
