class ProjectRolePermissionsController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :set_project_role
  before_action :check_permissions
  before_action :set_permission, only: [:create, :destroy]
  before_action :set_project_role_permission, only: [:destroy]

  def index
    @project_role_permissions = @project_role.permissions
    @disabled = !manage_permission?
  end

  def create
    @project_role_permission = ProjectRolePermission.new(
      project_role: @project_role,
      permission: @permission
    )

    @project_role_permission.save
  end

  def destroy
    @project_role_permission.destroy
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    redirect_to project_roles_path(code: @project.code), alert: 'Not Found' \
      unless @project_role
  end

  # rubocop:disable Style/MultilineIfModifier
  def set_permission
    @permission = Permission.find_by(id: project_role_permissions_params.to_i)
    redirect_to project_role_path(code: @project.code,
                                  name: @project_role.name) \
      unless @permission
  end

  def set_project_role_permission
    @project_role_permission = ProjectRolePermission.find_by(
      project_role: @project_role,
      permission: @permission
    )

    redirect_to project_role_path(code: @project.code,
                                  name: @project_role.name),
                alert: 'Permission not found' \
      unless @project_role_permission
  end
  # rubocop:enable Style/MultilineIfModifier

  def project_role_permissions_params
    params.require(:permissions)
  end

  def manage_permission?
    current_user.permission?('projects.roles.manage',
                             'projects.roles.manage.permissions',
                             "#{@project.id}.projects.roles.manage",
                             "#{@project.id}.project.manage.groups.permissions")
  end

  # This controller should only be accessible through xhr/ajax requests
  def check_format
    not_found unless request.xhr?
  end
end
