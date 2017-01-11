class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(_resource)
    authenticated_root_path
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def unauthenticated_only
    return unless current_user
    redirect_to after_sign_in_path_for(User),
                notice: 'You cannot do that as a logged in user'
  end
end
