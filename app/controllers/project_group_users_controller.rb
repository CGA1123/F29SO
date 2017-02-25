class ProjectGroupUsersController < ApplicationController
=begin
  before_action :check_view_permission, only: [:index]
  before_action :check_manage_permission, only: [:create, :destroy, :search]
  before_action :set_project_group
  before_action :set_project_group_user, only: [:destroy]
  before_action :set_user, only: [:create]

  def index
    @project_group_users = ProjectGroupUser.where(project_group: @project_group)
  end

  def create
    @project_group_user = ProjectGroupUser.new(user: @user, group: @project_group)
    path = project_group_path(code: @project_group.project.code, name: @project_group.name)

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
        format.html { redirect_to project_group_users_path }
        format.js {}
      else
        format.js { render :destroy_fail }
        format.html do
          redirect_to project_group_users_path, alert: "Can't remove user from group."
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

  def set_project_group
    @project_group = ProjectGroup.find_by(name: params[:name])
    redirect_to project_groups_path, alert: 'Group not found.' unless @project_group
  end

  def set_project_group_user
    @project_group_user = ProjectGroupUser.find_by(id: params[:id])
    redirect_to project_group_users_path, alert: 'User not found.' unless @project_group_user
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to project_group_path(name: @project_group.name), alert: 'User not found.' \
      unless @user
  end

  def check_view_permission
    check_permission('view')
  end

  def check_manage_permission
    check_permission('manage.users') ||
      check_permission('manage')
  end

  def check_permission(permission)
    user = current_user
    redirect_to projects_path, alert: 'You cannot perform this action.' unless \
    user.permission?("project.groups.#{permission}") ||
    user.permission?("#{project_id}.projects.groups.#{permission}")
  end
=end
end
