class GroupsController < PermissionController
  before_action :check_view_permission, only: [:index, :show]
  before_action :check_manage_permission, only: [:create, :destroy]
  before_action :set_group, only: [:show, :destroy]

  def index
    @groups = Group.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @groups = Group.all

    @group.save

    render :index
  end

  def show; end

  def destroy
    params = {}

    unless @group.destroy
      params = { alert: "You're not allowed to delete the root group." }
    end

    redirect_to groups_path, params
  end

  private

  def check_permission(permission)
    not_found unless current_user.permission?(permission)
  end

  def check_view_permission
    check_permission('admin.groups.view')
  end

  def check_manage_permission
    check_permission('admin.groups.manage')
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find_by(name: params[:name])
    redirect_to groups_path, alert: 'Group not found' unless @group
  end
end
