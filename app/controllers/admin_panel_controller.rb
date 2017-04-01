class AdminPanelController < PermissionController
  before_action :check_permissions

  def index
    @invitations_count = Invitation.count
    @project_types_count = ProjectType.count
    @groups_count = Group.count
    @user_active_count = User.where(active: true).count
    @user_diabled_count = User.count - @user_active_count
    @profiles = User.first(5)
  end
end
