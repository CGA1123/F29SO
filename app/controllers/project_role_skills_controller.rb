class ProjectRoleSkillsController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :check_permissions
  before_action :set_project_role
  before_action :set_skill, except: [:index, :update, :destroy]
  before_action :set_project_role_skill, only: [:update, :destroy]

  def create
    @project_role_skill = ProjectRoleSkill.new(project_role: @project_role,
                                               skill: @skill,
                                               rating: params[:rating])
    @project_role_skill.save
  end

  def destroy
    @project_role_skill.destroy
  end

  def update
    @project_role_skill.rating = params[:project_role_skill][:rating]
    @saved = @project_role_skill.save
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    head(404) unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project, name: params[:name])
    head(404) unless @project_role
  end

  def set_skill
    @skill = Skill.find_by(name: params[:skill])
    head(404) unless @skill
  end

  def check_format
    not_found unless request.xhr?
  end

  def set_project_role_skill
    @project_role_skill = ProjectRoleSkill.find_by(id: params[:id])
    head(404) unless @project_role_skill
  end
end
