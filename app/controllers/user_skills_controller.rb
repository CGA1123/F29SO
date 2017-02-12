class UserSkillsController < ApplicationController
  before_action :set_user

  def index
    @user_skills = UserSkill.where(user: @user)
    @skill_types = SkillType.all
    @skill_types.unshift(SkillType.new(id: 0,
                                       name: 'All Skills',
                                       description: 'Get all skills'))
  end

  def search
    @search_string = params[:skill_name].downcase
    @skill_type = params[:skill_type_id]
    if @skill_type == '0'
      Skill.all
    else
      Skill.where(skill_type_id: @skill_type)
    end
    @skills = @skills.where('lower(name) LIKE ?', "%#{@search_string}%")
    @skills = nil if @search_string.blank? || @skills.empty?
  end

  def create
    @user_skill = UserSkill.new(user: @user,
                                skill: Skill.find(params[:skill_id]),
                                rating: 'novice')
    @user_skill.save
    redirect_to user_skills_path(id: @user.id)
  end

  def edit
    @user_skill = UserSkill.find(params[:user_skill_id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @user_skill = UserSkill.find(params[:user_skill_id])
    @user_skill.rating = params[:user_skill][:rating].to_i
    @user_skill.save
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @user_skill = UserSkill.find(params[:user_skill_id])
    @user_skill.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to user_skills_path(id: @user.id) }
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to authenticated_root_path, alert: 'User not found' unless @user
  end
end
