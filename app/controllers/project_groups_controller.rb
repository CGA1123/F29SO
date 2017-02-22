class ProjectGroupsController < ApplicationController
  before_action :set_project, only: [:index, :create]

  def index
    @project_groups = ProjectGroup.where(project: @project)
  end

  def create
    @project_group = ProjectGroup.new(project_group_params)
    @project_group.project = @project
    @project_groups = ProjectGroup.where(project: @project)

    @project_group.save

    render :index
  end

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
    render 'group_users/search'
  end

  private

  def check_permissions(permission)
    user = current_user
    redirect_to projects_path, alert: 'You cannot perform this action.' unless \
    user.permission?("project.groups.#{permission}") ||
    user.permission?("#{project_id}.projects.groups.#{permission}")
  end

  def project_group_params
    params.require(:project_group).permit(:name)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end

  def set_project_group
    @project_group = ProjectGroup.find_by(name: params[:name])
    redirect_to group_projects_path, alert: 'Group not found' unless @projectGroup
  end
end
