class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def show
  end

  def edit
  end

  def update
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found.' unless @project
  end
end
