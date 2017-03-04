class ProjectsController < PermissionController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions

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
end
