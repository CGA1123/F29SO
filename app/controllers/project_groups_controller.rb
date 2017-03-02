class ProjectGroupsController < PermissionController
  before_action :set_project, only: [:index, :create, :destroy, :show]
  before_action :set_project_group, only: [:destroy, :show]
  before_action :check_permissions

  def index
    @project_groups = ProjectGroup.where(project: @project)
    @project_group = ProjectGroup.new
  end

  def create
    @project_group = ProjectGroup.new(project_group_params)
    @project_group.project = @project
    @project_groups = ProjectGroup.where(project: @project)

    @project_group.save

    render :index
  end

  def show; end

  def destroy
    @project_group.destroy

    msg = @project_group.destroyed? ? 'Group deleted' : "Can't remove Owners"
    redirect_to project_groups_path(code: @project.code),
                alert: msg
  end

  private

  def project_group_params
    params.require(:project_group).permit(:name)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' \
      unless @project
  end

  def set_project_group
    @project_group = ProjectGroup.find_by(project: @project,
                                          name: params[:name])
    redirect_to project_groups_path(code: @project.code), alert: 'Not found' \
      unless @project_group
  end
end
