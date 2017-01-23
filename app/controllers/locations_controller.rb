class LocationsController < ApplicationController
  before_action :check_permission

  def index
    @locations = Location.all
  end

  private

  def check_permission
    not_found unless current_user.permission?('admin.locations')
  end
end
