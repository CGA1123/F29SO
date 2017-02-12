class ProjectTypesController < ApplicationController
  before_action :check_permission
  before_action :set_project_type, only: [:destroy]

  def index
    @project_types = ProjectType.all
    @project_type = ProjectType.new
  end

  def create
    @project_type = ProjectType.new(project_type_params)
    @project_type.save

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @project_type.destroy

    respond_to do |format|
      format.js {}
    end
  end

  private

  def check_permission
    not_found unless current_user.permission?('admin.project_types')
  end

  def project_type_params
    params.require(:project_type).permit(:name, :description)
  end

  def set_project_type
    @project_type = ProjectType.find_by(id: params[:id])
    redirect_to project_types_path, alert: 'Project Type not found.' \
      unless @project_type
  end
end
