class ProjectGroupsController < ApplicationController
  before_action :set_project, only: [:index]

  def index
    @project_groups = ProjectGroup.where(project: @project)
  end

  private

  def check_permissions(permission)
    user = current_user
    redirect_to projects_path, alert: 'You do not have permission to perform this action.' unless \
    user.permission?("project.groups.#{permission}") ||
    user.permission?("#{project_id}.projects.groups.#{permission}")
  end

  def project_group_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end

  def set_project_groups
    @project_group = ProjectGroup.find_by(code: params[:code])
    redirect_to group_projects_path, alert: "Project Group not found" unless @projectGroup
  end
end
