class UserSkillsController < PermissionController
  before_action :set_user
  before_action :can_edit?
  before_action :check_permission, except: [:index]
  before_action :set_user_skill, only: [:destroy, :edit, :update]

  def index
    @user_skills = UserSkill.where(user: @user)
    @skill_types = SkillType.all
    @skill_types.unshift(SkillType.new(id: 0, name: 'All', description: ''))
  end

  def search
    @search_string = params[:skill_name].downcase

    type = params[:skill_type_id]
    @skills = type == '0' ? Skill.all : Skill.where(skill_type_id: type)
    @skills = @skills.where('lower(name) LIKE ?', "%#{@search_string}%")
    @skills = nil if @search_string.blank? || @skills.empty?
  end

  def create
    @user_skill = UserSkill.new(
      user: @user,
      skill: Skill.find_by(id: params[:skill_id]),
      rating: 'novice'
    )
    @user_skill.save

    redirect_to user_skills_path(id: @user.id)
  end

  def edit
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @user_skill.rating = params[:user_skill][:rating].to_i
    @user_skill.save
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @user_skill.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to user_skills_path(id: @user.id) }
    end
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

  def check_permission
    redirect_to user_skills_path(id: @user.id), alert: 'No Permission' \
      unless @edit
  end
end
