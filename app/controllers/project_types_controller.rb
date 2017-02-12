class ProjectTypesController < ApplicationController
  before_action :check_permission

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

  private

  def check_permission
    not_found unless current_user.permission?('admin.project_types')
  end

  def project_type_params
    params.require(:project_type).permit(:name, :description)
  end
end
