class ProjectGroupsController < ApplicationController
  before_action :set_project, only: [:index]
  def index
    @projectGroups = ProjectGroup.where(project: @project)
  end

  def create
    @projectGroup = ProjectGroup.new
    @projectGroups = ProjectGroups.where(project: @group.project_id)

    @projectGroup.save

    render :index
  end

  def show; end

  def edit; end

  def update
    if @projectGroup.update(project_group_params)
      redirect_to project_path(@project.reload.code)
    else
      @project.reload
      render :edit
    end
  end

  private

  def check_permission(permission)
    user = current_user
    redirect_to projects_path, alert: 'You do not have permission to perform this action.' unless \
    user.permission?("projects.#{permission}") ||
    user.permission?("#{project_id}.projects.groups.#{permission}")
  end

  def project_group_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end
end
