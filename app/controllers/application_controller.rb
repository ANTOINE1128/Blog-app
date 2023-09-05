class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  # This method sets the @current_user instance variable based on the user_id parameter.
  # It's a before_action, so it runs before every action in controllers that inherit from ApplicationController.
  def set_current_user
    user_id = params[:user_id]
    @current_user = User.find_by(id: user_id)
  end

  # This method enforces user authentication by redirecting to the root path unless a user is authenticated.
  def require_user
    redirect_to root_path unless @current_user
  end

  # This attr_reader makes the @current_user variable accessible within this class.
  attr_reader :current_user

  # This helper_method declaration makes the current_user method available in views.
  helper_method :current_user
end
