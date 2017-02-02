class GroupUsersController < ApplicationController
  before_action :set_group

  def index; end

  def create
    redirect_to group_users_path
  end

  def destroy
    redirect_to group_users_path
  end

  private

  def set_group
    @group = Group.find_by(name: params[:name])
    redirect_to groups_path, alert: 'Group not found.' unless @group
  end
end
