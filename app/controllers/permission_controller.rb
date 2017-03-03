class PermissionController < ApplicationController
  private

  def check_permissions
    send("check_#{controller_name}")
  end

  def check_admin_panel
  end

  def check_projects
  end

  def check_project_groups
  end

  def check_project_group_permissions
  end

  def check_project_locations
  end

  def check_groups
  end

  def check_group_users
  end

  def check_group_permissions
  end

  def check_profiles
  end

  def check_invitations
  end

  def check_project_types
  end

  def check_locations
  end
end
