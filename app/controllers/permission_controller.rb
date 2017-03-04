class PermissionController < ApplicationController
  private

  def check_permissions
    send("check_#{controller_name}")
  end

  def check_admin_panel
    not_found unless current_user.permission?('admin.panel')
  end

  def check_projects
    case action_name
    when 'new', 'create'
      redirect_to projects_path, alert: 'You cannot do that.' unless \
        current_user.permission?('projects.create')
    when 'edit', 'update'
      redirect_to projects_path, alert: 'You cannot do that.' unless \
        current_user.permission?('projects.edit',
                                 "#{@project.id}.projects.edit")
    when 'show'
      redirect_to projects_path, alert: 'You cannot do that.' unless \
        current_user.permission?('projects.view',
                                 "#{@project.id}.projects.view")
    when 'destroy'
      redirect_to projects_path, alert: 'You cannot do that.' unless \
        current_user.permission?('projects.delete',
                                 "#{@project.id}.projects.delete")
    end
  end

  def check_project_groups
    case action_name
    when 'create', 'destroy'
      not_found unless \
        current_user.permission?('projects.groups.manage',
                                 "#{@project.id}.projects.groups.manage")
    when 'index', 'show'
      not_found unless current_user.permission?('projects.view',
                                                "#{@project.id}.projects.view")
    end
  end

  def check_project_group_permissions
    case action_name
    when 'index'
      redirect_to project_groups_path(code: @project.code) unless \
        current_user.permission?('projects.view',
                                 "#{@project.id}.projects.view")
    when 'create', 'destroy'
      id = @project.id
      not_found unless \
        current_user.permission?('projects.groups.manage',
                                 'projects.group.manage.permissions',
                                 "#{id}.projects.groups.manage",
                                 "#{id}.projects.groups.manage.permissions")
    end
  end

  def check_groups
    case action_name
    when 'index', 'show'
      not_found unless current_user.permission?('admin.groups.view')
    when 'create', 'destroy'
      not_found unless current_user.permission?('admin.groups.manage')
    end
  end

  def check_group_users
    case action_name
    when 'index'
      not_found unless current_user.permission?('admin.groups.view')
    when 'create', 'destroy', 'search'
      not_found unless current_user.permission?('admin.groups.manage.users',
                                                'admin.groups.manage')
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
    end
  end

  def check_profiles
    case action_name
    when 'edit', 'update'
      redirect_to profile_path(@user), alert: 'Nope...' unless edit?(@user)
    end
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
    end
  end

  def check_project_types
    case action_name
    when 'index', 'create', 'destroy', 'edit', 'update'
      not_found unless current_user.permission?('admin.project_types')
    end
  end

  def check_locations
    case action_name
    when 'index', 'update', 'create', 'edit', 'destroy'
      not_found unless current_user.permission?('admin.locations')
    end
  end

  def check_user_skills
    case action_name
    when 'search', 'create', 'edit', 'update', 'destroy'
      redirect_to user_skills_path(id: @user.id), alert: 'No Permission' \
        unless @edit
    end
  end
end
