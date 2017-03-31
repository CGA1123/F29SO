class ProjectRolesController < PermissionController
  before_action :check_format
  before_action :set_project, only: [:create, :destroy]
  before_action :set_project_role, only: [:destroy]
  before_action :check_permissions

  def create
    @project_role = ProjectRole.new(project_role_params)
    @project_role.project = @project
    @project_roles = ProjectRole.where(project: @project)
    @project_role.save
  end

  def destroy
    @project_role.destroy
  end

  private

  def project_role_params
    params.require(:project_role)
          .permit(:name, :description, :start_date, :end_date)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    head(404) unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    head(404) unless @project_role
  end

  # This controller should only be accessible through xhr/ajax requests
  def check_format
    not_found unless request.xhr?
  end
end
