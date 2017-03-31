class SkillsController < PermissionController
  before_action :check_format
  before_action :set_skill, except: [:index, :create]
  before_action :check_permissions

  def create
    @skill = Skill.new(skill_params)
    @skill.description = '' if @skill.description.nil?
    @skill.save
  end

  def update
    if @skill.update(skill_params)
    else
      @skill.reload
    end
  end

  def destroy
    @skill.user_skills.delete_all
    @skill.project_role_skills.delete_all
    @skill.destroy
  end

  private

  def set_skill
    @skill = Skill.find_by(id: params[:id])
    head(404) unless @skill
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :skill_type_id)
  end

  def check_format
    not_found unless request.xhr?
  end
end
