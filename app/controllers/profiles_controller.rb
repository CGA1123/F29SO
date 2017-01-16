class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_permission, only: [:edit, :update]

  def show
    @can_edit = edit?(@user)
    @groups = @user.groups
    render '_show.html.erb'
  end

  def edit; end

  # :reek:TooManyStatements { max_statements: 7 }
  def update
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to profile_path(@user) }
      else
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :location_id)
  end

  # set @can_edit true/false
  # is true if the user is trying to edit himself AND he has 'profile.edit'
  # permission, OR if the user has the 'profile.edit.others' permission.
  def edit?(user)
    current = current_user
    (user == current && current.permission?('profile.edit')) ||  \
      current.permission?('profile.edit.others')
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to authenticated_root_path, alert: 'User not found.' unless @user
  end

  def check_permission
    redirect_to profile_path(@user), alert: 'Nope...' unless edit?(@user)
  end

  # section below for altering user's skills
  # need to check everything written here
  def skill_index;
    # get all skills for this user
    @skills = UserSkill.find_by(user: params[:user])
  end

  def skill_add;
    # add a skill to user's skill list
    @skill = UserSkill.new(skill_params)
    if @skill.save
      # success
    else
      # failure
    end
  end

  def skill_edit;
    # update a skill from user's skill list
    @skill = UserSkill.where(user: params[:user], skill: params[:skill])
    @skill.rating = # updated rating
    if @skill.save
      # success
    else
      # failure
    end

  end

  def skill_remove;
    # remove a skill from user's skill list
    @skill = UserSkill.where(user: params[:user], skill: params[:skill])
    if @skill.destroy
      # success
    else
      # failure
    end
  end

  def skill_params;
    params.require(:user_skill).permit(:user_id, :skill_id, :rating)
  end
end
