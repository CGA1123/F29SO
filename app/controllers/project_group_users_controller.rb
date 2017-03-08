class ProjectGroupUsersController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :set_project_group
  before_action :check_permissions
  before_action :set_project_group_user, only: [:destroy]
  before_action :set_user, only: [:create]

  def index
    @project_group_users = ProjectGroupUser.where(project_group: @project_group)
  end

  def create
    @project_group_user =
      ProjectGroupUser.new(user: @user, project_group: @project_group)
    path = project_group_path(code: @project.code, name: @project_group.name)

    @project_group_user.save
  end

  def destroy
    @project_group_user.destroy
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

  def set_project_group
    @project_group = ProjectGroup.find_by(project: @project,
                                          name: params[:name])
    return if @project_group
    flash[:alert] = 'ProjectGroup not found'
    redirect_to project_groups_path(code: @project.code)
  end

  def set_project_group_user
    @project_group_user = ProjectGroupUser.find_by(id: params[:id])
    return if @project_group_user
    flash[:alert] = 'Project group user not found'
    redirect_to project_group_users_path(code: @project.code)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return if @user
    flash[:alert] = 'User not found'
    redirect_to project_group_path(name: @project_group.name)
  end

  def check_format
    not_found unless request.xhr?
  end
end
