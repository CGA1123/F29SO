class ProjectTypesController < PermissionController
  before_action :check_permissions
  before_action :set_project_type, only: [:destroy, :edit, :update]
  before_action :set_can_manage, only: [:index]

  def index
    @project_types = ProjectType.all.sort_by(&:name)
    @project_type = ProjectType.new
  end

  def create
    @project_type = ProjectType.new(project_type_params)
    @project_type.save

    redirect_to project_types_path
  end

  def destroy
    @project_type.destroy

    respond_to do |format|
      format.js {}
    end
  end

  def edit; end

  def update
    @update_success = @project_type.update(project_type_params)
    @project_type.reload

    redirect_to project_types_path
  end

  private

  def project_type_params
    params.require(:project_type).permit(:name, :description)
  end

  def set_project_type
    @project_type = ProjectType.find_by(id: params[:id])
    redirect_to project_types_path, alert: 'Project Type not found.' \
      unless @project_type
  end

  def set_can_manage
    @can_manage = current_user.permission?('admin.project_types')
  end
end
