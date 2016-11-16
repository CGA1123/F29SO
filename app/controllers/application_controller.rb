class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(_resource)
    authenticated_root_path
  end

  # If a user is not logged in, or does not have appropriate permission to
  # invite a user, throw a 404.
  # This method is called before the actions: new, create
  def authenticate_inviter!
    not_found if current_user.nil? || !current_user.permission?('user.invite')
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
