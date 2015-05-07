module API
  # Base controller class for all versions of the API
  class BaseController < ApplicationController
    abstract!
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

    before_action :authenticate_admin!, only: []
    # before_action :cors_preflight_check

    after_action :cors_set_access_control_headers

    # For all responses in this controller, return the CORS access control headers.
    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = '*'
      headers['Access-Control-Max-Age'] = '1728000'
    end
  end
end
