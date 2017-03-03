class ProjectLocationsController < ApplicationController
  before_action :check_format
  before_action :set_project
  before_action :check_view_permission, only: [:index]
  before_action :check_manage_permission, only: [:create, :destroy, :edit]
  before_action :set_location, only: [:create, :destroy]

  def index
    @project_locations = @project.locations
  end

  def create
    @project_location = ProjectLocation.new(project: @project,
                                            location: @location)
    @project_location.save
  end

  def destroy
    @project_location = ProjectLocation.find_by(project: @project,
                                                location: @location)
    @project_location.destroy if @project_location
  end

  def edit; end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    not_found unless @project
  end

  def set_location
    @location = Location.find_by(id: params[:location_id])
    not_found unless @location
  end

  def check_format
    not_found unless request.xhr?
  end

  def check_view_permission
    user = current_user
    not_found unless \
      user.permission?('projects.view') ||
      user.permission?("#{@project.id}.projects.view")
  end

  def check_manage_permission
    user = current_user
    not_found unless \
      user.permission?('projects.manage') ||
      user.permission?('projects.manage.locations') ||
      user.permission?("#{@project.id}.projects.manage") ||
      user.permission?("#{@project.id}.projects.manage.locations")
  end
end
