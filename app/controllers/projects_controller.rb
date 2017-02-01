class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(code: @project.code)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project.reload.code)
    else
      @project.reload
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found.' unless @project
  end

  def project_params
    params.require(:project).permit(:code, :name, :project_type_id)
  end

  def check_permission(permission_name)
    not_found unless current_user.permission?
      ("#{project_id}.#{permission_name}")
  end
end
