class SkillsController < PermissionController
  before_action :set_skill, except: [:index, :create]
  before_action :check_permissions

  def index
    @skills = Skill.all
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(params)
    if @skill.save
      redirect_to skill_path(id: @skill.id)
    else
      @skills = Skill.all
    end
  end

  def update
    if @skill.update(params)
      redirect_to skill_path(id: @skill.reload.id)
    else
      @skill.reload
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private

  def set_skill
    @skill = Skill.find_by(id: params[:id])
    redirect_to skills_path, alert: 'Skill not found.' unless @skill
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :skill_type_id)
  end
end
