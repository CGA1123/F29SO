class GroupPermissionsController < PermissionController
  before_action :check_manage_permission, only: [:create, :destroy]
  before_action :check_view_permission, only: [:index]
  before_action :set_group
  before_action :set_permission, only: [:destroy, :create]
  before_action :set_group_permission, only: [:destroy]

  def index
    @group_permissions = @group.permissions
    @disabled = !(current_user.permission?('admin.groups.manage.permission') ||
                current_user.permission?('admin.groups.manage'))
  end

  def create
    @group_permission = GroupPermission.new(group: @group,
                                            permission: @permission)
    @group_permission.save

    respond_to do |format|
      format.js {}
      format.html { redirect_to group_path(name: @group.name) }
    end
  end

  def destroy
    @group_permission.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to group_path(name: @group.name) }
    end
  end

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

  def set_permission
    @permission = Permission.find_by(id: group_permission_params.to_i)
    redirect_to group_path(name: @group.name), alert: "Can't find permission" \
      unless @permission
  end

  def set_group_permission
    @group_permission =
      GroupPermission.find_by(group: @group, permission: @permission)

    redirect_to group_path(name: @group.name), alert: "Can't find permission" \
      unless @group_permission
  end

  def group_permission_params
    params.require(:permissions)
  end
end
