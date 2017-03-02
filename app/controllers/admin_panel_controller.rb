class AdminPanelController < PermissionController
  before_action :check_permissions

  def home; end
end
