class SkillsController < PermissionController

  def index
    @skills = Skill.all
  end

  def create
    @skill = new.Skill(params)
    @skill.save

    redirect_to skills_path
  end

  def update
  end

  def delete
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description, :skill_type_id)
  end
end
