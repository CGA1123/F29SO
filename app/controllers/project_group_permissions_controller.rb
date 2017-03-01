class ProjectGroupPermissionsController < ApplicationController
  before_action :check_format
  before_action :set_project
  before_action :set_project_group
  before_action :check_view_permission, only: [:index]
  before_action :check_manage_permission, only: [:create, :destroy]
  before_action :set_permission, only: [:create, :destroy]
  before_action :set_project_group_permission, only: [:destroy]

  def index
    @project_group_permissions = @project_group.permissions
    @disabled = !manage_permission?
  end

  def create
    @project_group_permission = ProjectGroupPermission.new(
      project_group: @project_group,
      permission: @permission
    )

    @project_group_permission.save
  end

  def destroy
    @project_group_permission.destroy
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end

  def set_project_group
    @project_group = ProjectGroup.find_by(project: @project,
                                          name: params[:name])
    redirect_to project_groups_path(code: @project.code), alert: 'Not Found' \
      unless @project_group
  end

  # rubocop:disable Style/MultilineIfModifier
  def set_permission
    @permission = Permission.find_by(id: project_group_permissions_params.to_i)
    redirect_to project_group_path(code: @project.code,
                                   name: @project_group.name) \
      unless @permission
  end

  def set_project_group_permission
    @project_group_permission = ProjectGroupPermission.find_by(
      project_group: @project_group,
      permission: @permission
    )

    redirect_to project_group_path(code: @project.code,
                                   name: @project_group.name),
                alert: 'Permission not found' \
      unless @project_group_permission
  end
  # rubocop:enable Style/MultilineIfModifier

  def project_group_permissions_params
    params.require(:permissions)
  end

  def manage_permission?
    user = current_user
    (user.permission?('projects.groups.manage') ||
     user.permission?('projects.groups.manage.permissions') ||
     user.permission?("#{@project.id}.projects.groups.manage") ||
     user.permission?("#{@project.id}.project.manage.groups.permissions"))
  end

  def check_manage_permission
    not_found unless manage_permission?
  end

  def check_view_permission
    view_permission = current_user.permission?('projects.view') ||
                      current_user.permission?("#{@project.id}.projects.view")
    redirect_to project_groups_path(code: @project.code) unless view_permission
  end

  # This controller should only be accessible through xhr/ajax requests
  def check_format
    not_found unless request.xhr?
  end
end
