class AdminPanelController < PermissionController
  before_action :check_permissions

  def index; end
end
