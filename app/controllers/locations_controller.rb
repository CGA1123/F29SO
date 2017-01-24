class LocationsController < ApplicationController
  before_action :check_permission
  before_action :set_location, only: [:edit, :update]

  def index
    @locations = Location.all
  end

  def edit; end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to locations_path }
        format.js { render :update_success }
      else
        @location.reload
        format.html { redirect_to locations_path, alert: 'Update failed.' }
        format.js { render :update_fail }
      end
    end
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end

  def set_location
    @location = Location.find_by(id: params[:id])
    redirect_to locations_path, alert: 'Location not found.' unless @location
  end

  def check_permission
    not_found unless current_user.permission?('admin.locations')
  end
end
