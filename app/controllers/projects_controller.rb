class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :check_create_permission, only: [:new, :create]
  before_action :check_update_permissions, only: [:edit, :update]
  before_action :check_destroy_permission, only: [:destroy]
  before_action :check_view_permission, only: [:show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      ProjectGroup.create(name: 'Owner',
                          description: 'The Owner Group',
                          project: @project)
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

  def destroy
    @project.destroy
    redirect_to projects_path, alert: 'Project Deleted.'
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found.' unless @project
  end

  def project_params
    params.require(:project).permit(:code, :name, :project_type_id)
  end

  def check_create_permission
    user = current_user
    redirect_to projects_path, alert: 'You cannot do that.' unless \
      user.permission?('projects.create')
  end

  def check_update_permissions
    check_permission('edit')
  end

  def check_destroy_permission
    check_permission('delete')
  end

  def check_view_permission
    check_permission('view')
  end

  def check_permission(permission)
    user = current_user
    redirect_to projects_path, alert: 'You cannot do that.' unless \
      user.permission?("projects.#{permission}") ||
      user.permission?("#{@project.id}.projects.#{permission}")
  end
end
