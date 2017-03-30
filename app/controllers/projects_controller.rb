class ProjectsController < PermissionController
  before_action :set_project, except: [:index, :create, :search]
  before_action :check_format, only: [:search]
  before_action :check_permissions

  def index
    @projects = Project.order('name ASC')
    @project = Project.new
    @can_create = current_user.permission?('projects.create')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      ProjectRole.create(name: 'Owner',
                         description: 'The Owner Group',
                         project: @project,
                         locations: [current_user.location])
      redirect_to project_path(code: @project.code)
    else
      @projects = Project.all
    end
  end

  def show
    @announcements = ProjectAnnouncement
                     .where(project: @project).order('created_at DESC').first(3)
    @can_manage_permissions = check_manage('permissions')
    @can_manage_users = check_manage('users')
    @can_manage_skills = check_manage('skills')
    @can_manage_locations = check_manage('locations')
  end

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

  # rubocop:disable Metrics/AbcSize
  def search
    type = params[:type]
    string = params[:search_bar]
    projects = params[:own].present? ? current_user.projects : Project.all
    projects = projects.where(project_type_id: type.to_i) if type.present?
    projects = projects.search(string) if string.present?
    @projects = projects.order(:name)
  end
  # rubocop:enable Metrics/AbcSize

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found.' unless @project
  end

  def project_params
    params.require(:project).permit(:code,
                                    :name,
                                    :description,
                                    :project_type_id)
  end

  def check_format
    not_found unless request.xhr?
  end

  def check_manage(string)
    current_user.permission?('project.roles.manage',
                             "projects.roles.manage.#{string}",
                             "#{@project.id}.projects.roles.manage.#{string}",
                             "#{@project.id}.projects.roles.manage")
  end
end
