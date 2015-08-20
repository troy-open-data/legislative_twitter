# Base controller class for the application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:index, :show]

  # For demo only
  before_action :disable_deletion, only: :destroy

  private

  def disable_deletion
    redirect_to root_path, notice: 'Deletion is disabled for application demo'
  end
end
