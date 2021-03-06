# rubocop:disable Metrics/ClassLength
class ProjectsController < PermissionController
  before_action :set_project, except: [:index, :create, :search]
  before_action :check_format, only: [:search]
  before_action :check_permissions
  before_action :set_can_edit, only: [:show]
  before_action :set_can_delete, only: [:show]

  def index
    @projects = current_user.projects
    @project = Project.new
    @can_create = current_user.permission?('projects.create')
  end

  # rubocop:disable Metrics/MethodLength
  def create
    @project = Project.new(project_params)
    if @project.save
      ProjectRole.create(name: 'Owner',
                         description: 'The Owner Group',
                         project: @project,
                         locations: [current_user.location],
                         start_date: @project.start_date,
                         end_date: @project.end_date,
                         users: [current_user])

      redirect_to project_path(code: @project.code)
    else
      @projects = Project.all
    end
  end
  # rubocop:enable Metrics/MethodLength

  def show
    @announcements = ProjectAnnouncement
                     .where(project: @project).order('created_at DESC').first(3)
    @can_manage_permissions = check_manage('permissions')
    @can_manage_users = check_manage('users')
    @can_manage_skills = check_manage('skills')
    @can_manage_locations = check_manage('locations')
    @can_manage_roles = check_manage('')
    @skills_data = skills_data
    @locations_data = locations_data
  end

  def edit; end

  def update
    @project.update(project_params)
    redirect_to project_path(@project.reload.code)
  end

  def destroy
    roles = @project.project_roles
    roles.each do |role|
      role.project_role_users.destroy_all
      role.project_role_locations.destroy_all
      role.project_role_skills.destroy_all
      role.project_role_permissions.destroy_all
    end

    roles.destroy_all
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
                                    :project_type_id,
                                    :start_date,
                                    :end_date)
  end

  def check_format
    not_found unless request.xhr?
  end

  def check_manage(string)
    @project.owner?(current_user) || current_user.permission?(
      'project.roles.manage',
      "projects.roles.manage.#{string}",
      "#{@project.id}.projects.roles.manage.#{string}",
      "#{@project.id}.projects.roles.manage"
    )
  end

  def skills_data
    data = {}
    Skill.all.each { |s| data[s.name] = nil }
    data.to_json
  end

  def locations_data
    data = {}
    Location.all.each { |s| data[s.name] = nil }
    data.to_json
  end

  def set_can_edit
    if @project
      @can_edit = current_user.permission?(
        'project.edit',
        "#{@project.id}.project.edit"
      )
    else
      @can_edit = current_user.permission?('project.edit')
    end
  end

  def set_can_delete
    if @project
      @can_delete = current_user.permission?(
        'project.delete',
        "#{@project.id}.project.delete"
      )
    else
      @can_delete = current_user.permission?('project.delete')
    end
  end
end
