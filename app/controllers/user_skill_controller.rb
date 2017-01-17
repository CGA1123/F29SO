class UserSkillController < ApplicationController
  def skill_index
    # get all skills for this user
    @skills = UserSkill.find_by(user: params[:user])
  end

  def skill_add
    # add a skill to user's skill list
    @skill = UserSkill.new(skill_params)
    if @skill.save
      # success
    else
      # failure
    end
  end

  def skill_edit
    # update a skill from user's skill list
    @skill = UserSkill.where(user: params[:user], skill: params[:skill])
    @skill.rating = # updated rating
    if @skill.save
      # success
    else
      # failure
    end
  end

  def skill_remove
    # remove a skill from user's skill list
    @skill = UserSkill.where(user: params[:user], skill: params[:skill])
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
