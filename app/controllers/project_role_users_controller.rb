class ProjectRoleUsersController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :set_project_role
  before_action :check_permissions
  before_action :set_project_role_user, only: [:destroy]
  before_action :set_user, only: [:create]

  def index
    @project_role_users = ProjectRoleUser.where(project_role: @project_role)
  end

  def create
    @project_role_user =
      ProjectRoleUser.new(user: @user, project_role: @project_role)
    @project_role_user.save
  end

  def destroy
    @project_role_user.destroy
  end

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' \
      unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    return if @project_role
    flash[:alert] = 'Project role not found'
    redirect_to project_roles_path(code: @project.code)
  end

  def set_project_role_user
    @project_role_user = ProjectRoleUser.find_by(project_role: @project_role,
                                                 user: params[:id])
    return if @project_role_user
    flash[:alert] = 'Project group user not found'
    redirect_to project_role_users_path(code: @project.code,
                                        name: @project_role.name)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return if @user
    flash[:alert] = 'User not found'
    redirect_to project_role_path(name: @project_role.name)
  end

  def check_format
    not_found unless request.xhr?
  end
end
