class AdminPanelController < PermissionController
  before_action :check_permissions

  def index
    @invitations_count = Invitation.count
    @project_types_count = ProjectType.count
    @groups_count = Group.count
  end
end
