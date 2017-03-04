class ProjectLocationsController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :check_permissions
  before_action :set_location, only: [:create, :destroy]

  def index
    @project_locations = @project.locations
  end

  def create
    @project_location = ProjectLocation.new(project: @project,
                                            location: @location)
    @project_location.save
  end

  def destroy
    @project_location = ProjectLocation.find_by(project: @project,
                                                location: @location)
    @project_location.destroy if @project_location
  end

  def edit
    @source = source
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    not_found unless @project
  end

  def set_location
    @location = Location.find_by(id: params[:location_id])
    not_found unless @location
  end

  def check_format
    not_found unless request.xhr?
  end

  def source
    sources = []
    Location.all.each do |l|
      sources << { label: l.name, value: { id: l.id, project: @project.code } }
    end

    sources.to_json
  end
end
