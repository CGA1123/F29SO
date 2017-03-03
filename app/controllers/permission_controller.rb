class PermissionController < ApplicationController
  private

  def check_permissions
    send("check_#{controller_name}")
  end

  def check_admin_panel
    not_found unless current_user.permission?('admin.panel')
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
    case action_name
    when 'index', 'show'
      not_found unless current_user.permission?('admin.groups.view')
    when 'create', 'destroy'
      not_found unless current_user.permission?('admin.groups.manage')
    else
      not_found
    end
  end

  def check_group_users
    case action_name
    when 'index'
      not_found unless current_user.permission?('admin.groups.view')
    when 'create', 'destroy', 'search'
      not_found unless current_user.permission?('admin.groups.manage.users',
                                                'admin.groups.manage')
    else
      not_found
    end
  end

  def check_group_permissions
    case action_name
    when 'create', 'destroy'
      not_found unless \
        current_user.permission?('admin.groups.manage.permission',
                                 'admin.groups.manage')
    when 'index'
      not_found unless current_user.permission?('admin.groups.view')
    else
      not_found
    end
  end

  def check_profiles
  end

  def check_invitations
    case action_name
    when 'create'
      user = current_user
      not_found unless user.permission?('users.invite')
      groups = invite_params[:groups]
      groups.each do |group|
        message = "You don't have permission to invite #{group.name}"
        redirect_to new_invitation_path, alert: message \
          unless user.permission?("users.invite.#{group.id}")
      end
    when 'new', 'index', 'destroy'
      not_found unless current_user.permission?('users.invite')
    when 'accept', 'create_user'
      return
    else
      not_found
    end
  end

  def check_project_types
  end

  def check_locations
  end
end
