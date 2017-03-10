class ProjectRoleLocationsController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :set_project_role
  before_action :check_permissions
  before_action :set_location, only: [:create, :destroy]

  def index
    @project_role_locations = @project_role.locations
  end

  def create
    @project_role_location =
      ProjectRoleLocation.new(project_role: @project_role, location: @location)
    @project_role_location.save
  end

  def destroy
    @project_role_location =
      ProjectRoleLocation.find_by(project_role: @project_role,
                                  location: @location)
    @project_role_location.destroy if @project_role_location
  end

  def edit
    @source = source
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    not_found unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    redirect_to project_roles_path(code: @project.code), alert: 'Not Found' \
      unless @project_role
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
      sources << { label: l.name,
                   value: { id: l.id,
                            project: @project.code,
                            role: @project_role.name } }
    end

    sources.to_json
  end
end
