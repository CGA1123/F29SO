class GroupUsersController < PermissionController
  before_action :check_view_permission, only: [:index]
  before_action :check_manage_permission, only: [:create, :destroy, :search]
  before_action :set_group
  before_action :set_group_user, only: [:destroy]
  before_action :set_user, only: [:create]

  def index
    @group_users = GroupUser.where(group: @group)
  end

  def create
    @group_user = GroupUser.new(user: @user, group: @group)
    path = group_path(name: @group.name)

    respond_to do |format|
      if @group_user.save
        format.html { redirect_to path, notice: 'User Added.' }
      else
        format.html { redirect_to path, alert: 'User could not be added.' }
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def destroy
    respond_to do |format|
      if @group_user.destroy
        format.html { redirect_to group_users_path }
        format.js {}
      else
        format.js { render :destroy_fail }
        format.html do
          redirect_to group_users_path, alert: "Can't remove user from group." \
            'A user must belong to at least one group.'
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
    render 'group_users/search'
  end

  private

  def set_group
    @group = Group.find_by(name: params[:name])
    redirect_to groups_path, alert: 'Group not found.' unless @group
  end

  def set_group_user
    @group_user = GroupUser.find_by(id: params[:id])
    redirect_to group_users_path, alert: 'User not found.' unless @group_user
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to group_path(name: @group.name), alert: 'User not found.' \
      unless @user
  end

  def check_view_permission
    check_permission('admin.groups.view')
  end

  def check_manage_permission
    check_permission('admin.groups.manage.users') ||
      check_permission('admin.groups.manage')
  end

  def check_permission(permission)
    not_found unless current_user.permission?(permission)
  end
end
