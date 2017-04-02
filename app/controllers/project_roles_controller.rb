class ProjectRolesController < PermissionController
  before_action :check_format
  before_action :set_project, only: [:create, :destroy]
  before_action :set_project_role, only: [:destroy]
  before_action :check_permissions

  def create
    @project_role = ProjectRole.new(project_role_params)
    @project_role.project = @project
    @project_roles = ProjectRole.where(project: @project)
    @can_manage_permissions = check_manage('permissions')
    @can_manage_users = check_manage('users')
    @can_manage_skills = check_manage('skills')
    @can_manage_locations = check_manage('locations')
    @skills_data = skills_data
    @locations_data = locations_data

    @project_role.save
  end

  def destroy
    @project_role.destroy
  end

  private

  def project_role_params
    params.require(:project_role)
          .permit(:name, :description, :start_date, :end_date)
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    head(404) unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    head(404) unless @project_role
  end

  def check_manage(string)
    @project.owner?(current_user) || \
      current_user.permission?('project.roles.manage',
                               "projects.roles.manage.#{string}",
                               "#{@project.id}.projects.roles.manage.#{string}",
                               "#{@project.id}.projects.roles.manage")
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

  # This controller should only be accessible through xhr/ajax requests
  def check_format
    not_found unless request.xhr?
  end
end
