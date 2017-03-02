class AdminPanelController < PermissionController
  before_action :check_permissions

  def home; end

  private

  def check_permissions
    not_found unless current_user.permission?('admin.panel')
  end
end
