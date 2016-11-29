class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_permission, only: [:edit, :update]

  def show
    @can_edit = edit?(@user)
    @groups = @user.groups
    render '_show.html.erb'
  end

  def edit
  end

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
    params.require(:user).permit(:first_name, :last_name, :location)
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
    @user = User.find(params[:id])
  end

  def check_permission
    redirect_to profile_path(@user), alert: 'Nope...' unless edit?(@user)
  end
end
