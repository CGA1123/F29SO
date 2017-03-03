class ProjectGroupUsersController < ApplicationController
  before_action :set_project
  before_action :set_project_group
  before_action :check_view_permission, only: [:index]
  before_action :check_manage_permission, only: [:create, :destroy, :search]
  before_action :set_project_group_user, only: [:destroy]
  before_action :set_user, only: [:create]

  def index
    @project_group_users = ProjectGroupUser.where(project_group: @project_group)
  end

  def create
    @project_group_user =
      ProjectGroupUser.new(user: @user, project_group: @project_group)
    path = project_group_path(code: @project.code, name: @project_group.name)

    respond_to do |format|
      if @project_group_user.save
        format.html { redirect_to path, notice: 'User Added.' }
      else
        format.html { redirect_to path, alert: 'User could not be added.' }
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def destroy
    respond_to do |format|
      if @project_group_user.destroy
        format.html do
          redirect_to project_group_users_path(code: @project.code,
                                               name: @project_group.name)
        end

        format.js {}
      else
        format.js { render :destroy_fail }
        format.html do
          redirect_to project_group_users_path(code: @project.code,
                                               name: @project_group.name), alert: "Can't remove user from group." \
            'A user must belong to at least one group.'
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
    render 'project_group_users/search'
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' \
      unless @project
  end

  def set_project_group
    @project_group = ProjectGroup.find_by(project: @project,
                                          name: params[:name])
    return if @project_group
    redirect_to project_groups_path(code: @project.code), alert: 'Project Group not found.'
  end

  def set_project_group_user
    @project_group_user = ProjectGroupUser.find_by(id: params[:id])
    return if @project_group_user
    redirect_to project_group_users_path(code: @project.code), alert: 'Not found.'
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return if @user
    redirect_to project_group_path(name: @project_group.name), alert: 'User not found.'
  end

  def check_view_permission
    check_permission('admin.projects.groups.view')
  end

  def check_manage_permission
    check_permission('admin.projects.groups.manage.users') ||
      check_permission('admin.projects.groups.manage')
  end

  def check_permission(permission)
    not_found unless current_user.permission?(permission)
  end
end
