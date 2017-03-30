class SkillTypesController < PermissionController
  before_action :check_permissions
  before_action :set_skill_type, only: [:destroy, :edit, :update]

  def index
    @skill_types = SkillType.all
    @skill_type = SkillType.new
  end

  def create
    @skill_type = SkillType.new(skill_type_params)
    @skill_type.save

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @skill_type.destroy

    respond_to do |format|
      format.js {}
    end
  end

  def edit
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @update_success = @skill_type.update(skill_type_params)
    @skill_type.reload
  end

  private

  def skill_type_params
    params.require(:skill_type).permit(:name, :description)
  end

  def set_skill_type
    @skill_type = SkillType.find_by(id: params[:id])
    redirect_to skill_types_path, alert: 'Skill Type not found.' \
      unless @skill_type
  end
end
