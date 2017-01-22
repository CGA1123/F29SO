class UserSkillController < ApplicationController
  def search
    search_string = params[:skill_search].downcase
    @skills = Skill.where('lower(name) LIKE ?', search_string.to_s)
    @skills = nil if search_string.blank? || @skills.empty?
  end

  def index
    # get all skills for this user
    @skills = UserSkill.find_by(user: params[:user_id])
    # BELOW WILL BE USEFUL TO RENDER EACH RESULT AS RETURNED
    # SELECT skill_name FROM userskill INNER JOIN skill
    # ON skill.skill_name = userskill.name WHERE user_id = 'user_id'
    UserSkill.select(:skill_name).joins(:skill).where(user_id: params[:user_id]).find_each do |skill|
      # RENDER VIEW
    end
  end

  def add
    # add a skill to user's skill list
    @skill = UserSkill.new(skill_params)
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
    params.require(:user_skill).permit(:user_id, :skill_id, :rating)
  end
end
