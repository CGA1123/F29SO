class ProfilesController < ApplicationController
  def show
    @user = current_user
    @groups = @user.groups
  end
end
