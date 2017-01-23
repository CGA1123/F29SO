class UserSkillsController < ApplicationController
  before_action :set_user

  def search
    @skill_type = SkillType.where(id: params[:skill_type_id])
    @skill_type.each{ |x| @skill_type_id = x.id }
    @search_string = params[:skill_name].downcase
    @skills = Skill.where('lower(name) LIKE ? AND skill_type_id = ?', "%#{@search_string}%", "#{@skill_type_id}")
    @skills = nil if @search_string.blank? || @skills.empty?
  end

  def index
    # get all skills for this user
    @user_skill = UserSkill.new
    @user_skills = UserSkill.find_by(user: @user)
    # BELOW WILL BE USEFUL TO RENDER EACH RESULT AS RETURNED
    # SELECT skill_name FROM userskill INNER JOIN skill
    # ON skill.skill_name = userskill.name WHERE user_id = 'user_id'
    # UserSkill.select(:skill_name).joins(:skill).where(user_id: params[:user_id]).find_each do |skill|
      # RENDER VIEW
    # end
  end

  def create
    # add a skill to user's skill list
    @user_skill = UserSkill.new(skill_params)
    if @skill.save
      # success
    else
      # failure
    end
  end

  def edit
    # update a skill from user's skill list
    @skill = UserSkill.where(user: params[:user_id], skill: params[:skill_id])
    @skill.rating = # UPDATED RATING
    if @skill.save
      # success
    else
      # failure
    end
  end

  def remove
    # remove a skill from user's skill list
    @skill = UserSkill.where(user: params[:user_id], skill: params[:skill_id])
    if @skill.destroy
      # success
    else
      # failure
    end
  end

  private

  def skill_params
    params.require(:user_skill).permit(:skill_id, :rating)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to authenticated_root_path, alert: 'User not found' unless @user
  end
end
