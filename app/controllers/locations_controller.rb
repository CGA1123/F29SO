class LocationsController < PermissionController
  before_action :check_format
  before_action :check_permissions
  before_action :set_location, only: [:update, :destroy]

  def update
    @location.update(location_params)
    @location.reload
  end

  def create
    @location = Location.new(location_params)
    @location.save
  end

  def destroy
    @location.destroy unless @location.users.any?
  end

  private

  def location_params
    params.require(:location).permit(:name, :description)
  end

  def set_location
    @location = Location.find_by(id: params[:id])
    head(404) unless @location
  end

  def check_format
    not_found unless request.xhr?
  end
end
