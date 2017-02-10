class ProjectTypesController < ApplicationController
  before_action :check_permission

  def index
    @project_types = ProjectType.all
  end

  private

  def check_permission
    not_found unless current_user.permission?('admin.project_types')
  end
end
