class ProjectGroupsController < ApplicationController
  before_action :set_project, only: [:index, :create]
  before_action :check_manage_permission, only: [:create]
  before_action :check_view_permission, only: [:index]

  def index
    @project_groups = ProjectGroup.where(project: @project)
    @project_group = ProjectGroup.new
  end

  def create
    @project_group = ProjectGroup.new(project_group_params)

    @project_group.project = @project

    @project_group.save

    render :index
  end

  def destroy
    @project_group.destroy

    redirect_to groups_path, alert: 'Project group deleted.'
  end

  private

  def check_permission(permission)
    not_found unless \
    current_user.permission?("projects.groups.#{permission}") ||
    current_user.permission?("#{@project.id}.projects.groups.#{permission}")
  end

  def check_view_permission
    check_permission('view')
  end

  def check_manage_permission
    check_permission('manage')
  end

  def project_group_params
    params.require(:project_group).permit(:name)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end

  def set_project_group
    @project_group = ProjectGroup.find_by(project: params[@project])
    redirect_to group_projects_path, alert: 'Group not found' unless \
    @projectGroup
  end
end
