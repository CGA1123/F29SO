class ProjectTypesController < PermissionController
  before_action :check_format
  before_action :check_permissions
  before_action :set_project_type, only: [:update, :destroy]

  def create
    @project_type = ProjectType.new(project_type_params)
    @project_type.save
  end

  def update
    @project_type.update(project_type_params)
    @project_type.reload
  end

  def destroy
    @project_type.destroy unless @project_type.projects.any?
  end

  private

  def project_type_params
    params.require(:project_type).permit(:name, :description)
  end

  def set_project_type
    @project_type = ProjectType.find_by(id: params[:id])
    head(404) unless @project_type
  end

  def check_format
    not_found unless request.xhr?
  end
end
