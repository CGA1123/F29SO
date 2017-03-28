class ProjectRolesController < PermissionController
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

    msg = @project_role.destroyed? ? 'Group deleted' : "Can't remove Owners"
    redirect_to project_roles_path(code: @project.code),
                alert: msg
  end

  private

  def project_role_params
    params.require(:project_role).permit(:name, :description)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' \
      unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    redirect_to project_roles_path(code: @project.code), alert: 'Not found' \
      unless @project_role
  end
end
