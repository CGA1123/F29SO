class GroupPermissionsController < ApplicationController
  before_action :check_manage_permission, only: [:create, :destroy]
  before_action :check_view_permission, only: [:index]
  before_action :set_group

  def index
    @group_permissions = @group.permissions
  end

  def create; end

  def destroy; end

  private

  def check_manage_permission
    not_found unless \
      current_user.permission?('admin.groups.manage.permission') \
      || current_user.permission?('admin.groups.manage')
  end

  def check_view_permission
    not_found unless current_user.permission?('admin.groups.view')
  end

  def set_group
    @group = Group.find_by(name: params[:name])
    redirect_to groups_path, alert: 'Group not found' unless @group
  end
end
