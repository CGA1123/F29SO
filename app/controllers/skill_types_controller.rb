class SkillTypesController < PermissionController
  before_action :check_format
  before_action :check_permissions
  before_action :set_skill_type, only: [:update, :destroy]

  def create
    @skill_type = SkillType.new(skill_type_params)
    @skill_type.save
  end

  def update
    @update_success = @skill_type.update(skill_type_params)
    @skill_type.reload
  end

  def destroy
    @skill_type.destroy unless @skill_type.skills.any?
  end

  private

  def skill_type_params
    params.require(:skill_type).permit(:name, :description)
  end

  def set_skill_type
    @skill_type = SkillType.find_by(id: params[:id])
    head(404) unless @skill_type
  end

  def check_format
    not_found unless request.xhr?
  end
end
