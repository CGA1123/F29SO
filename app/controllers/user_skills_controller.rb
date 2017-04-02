class UserSkillsController < PermissionController
  before_action :check_format
  before_action :set_user
  before_action :can_edit?
  before_action :check_permissions
  before_action :set_user_skill, only: [:destroy, :edit, :update]

  def create
    name = params[:user_skill][:skill_id].downcase
    @user_skill = UserSkill.new(
      user: @user,
      skill: Skill.where('lower(name) = ?', name).first,
      rating: params[:user_skill][:rating].to_sym
    )
    @user_skill.save
  end

  def update
    @user_skill.rating = params[:user_skill][:rating].to_sym
    @user_skill.save
  end

  def destroy
    @user_skill.destroy
  end

  private

  def set_user_skill
    @user_skill = UserSkill.find_by(id: params[:user_skill_id])
    redirect_to user_skills_path(id: @user.id), alert: 'Skill not found' \
      unless @user_skill
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to authenticated_root_path, alert: 'User not found' unless @user
  end

  def can_edit?
    u = current_user
    perm = 'profile.skills.manage'
    @edit = u == @user ? u.permission?(perm) : u.permission?("#{perm}.others")
  end

  def check_format
    not_found unless request.xhr?
  end
end
