class GroupsController < ApplicationController
  before_action :check_permissions

  def index
    @groups = Group.all
  end

  private

  def check_permissions
    not_found unless current_user.permission?('admin.groups')
  end
end
