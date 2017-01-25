class UserSkillsController < ApplicationController
  before_action :set_user

  def search
  @search_string = params[:skill_name].downcase
    if (params[:skill_type_id] == '0')
      @skills = Skill.where('lower(name) LIKE ?', "%#{@search_string}%")
    else
      @skill_type = SkillType.find(params[:skill_type_id])
      @skills = Skill.where('lower(name) LIKE ? AND skill_type_id = ?', "%#{@search_string}%", "#{@skill_type.id}")
    end
    @skills = nil if @search_string.blank? || @skills.empty?
  end

  def index
    @user_skills = UserSkill.where(user: @user)
    @skill_types = SkillType.all
    @skill_types.unshift(SkillType.new(id: 0, name: 'All Skills', description: 'Get all skills'))
  end

  def create
    @user_skill = UserSkill.new(user: @user, skill: Skill.find(1), rating: 'novice')
    if @skill.save
      # success
    else
      # failure
    end
  end

  def edit
    @skill.rating = 'dropdown value from relevant skill'
    if @skill.save
      # success
    else
      # failure
    end
  end

  def remove
    @skill = UserSkill.find('id of skill from relevant remove button')
    if @skill.destroy
      # success
    else
      # failure
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to authenticated_root_path, alert: 'User not found' unless @user
  end
end
