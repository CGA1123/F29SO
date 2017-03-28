class ProjectRoleSkillsController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :check_permissions
  before_action :set_project_role
  before_action :set_skill, except: [:index, :edit]
  before_action :set_project_role_skill, only: [:destroy, :update]

  def create
    @project_role_skill = ProjectRoleSkill.new(project_role: @project_role,
                                               skill: @skill,
                                               rating: :basic)
    @project_role_skill.save
  end

  def destroy
    @project_role_skill.destroy
  end

  def edit
    @project_role_skills = @project_role.project_role_skills
    @source = source
  end

  def update
    @project_role_skill.rating = params[:rating]
    @saved = @project_role_skill.save
  end

  private

  def set_project_role_skill
    @project_role_skill = ProjectRoleSkill.find_by(project_role: @project_role,
                                                   skill: @skill)
    head(404) unless @project_role_skill
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    head(404) unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project, name: params[:name])
    head(404) unless @project_role
  end

  def set_skill
    @skill = Skill.find_by(id: params[:skill_id])
    head(404) unless @skill
  end

  def check_format
    not_found unless request.xhr?
  end

  def source
    sources = []
    Skill.all.each do |skill|
      sources << { label: skill.name,
                   value: { skill_id: skill.id,
                            project: @project.code,
                            role: @project_role.name } }
    end

    sources.to_json
  end
end
