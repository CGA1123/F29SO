class ProjectGroupsController < ApplicationController
<<<<<<< HEAD
  before_action :set_project, only: [:index]
=======
  before_action :set_project, only: [:index, :create]
>>>>>>> 078e52cb565b33078485fb74688b0b6e3a9da05d

  def index
    @project_groups = ProjectGroup.where(project: @project)
  end

<<<<<<< HEAD
=======
  def create
    @project_group = ProjectGroup.new(project_group_params)
    @project_group.project = @project
    @project_groups = ProjectGroup.where(project: @project)

    @project_group.save

    render :index
  end

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
    render 'group_users/search'
  end

>>>>>>> 078e52cb565b33078485fb74688b0b6e3a9da05d
  private

  def check_permissions(permission)
    user = current_user
<<<<<<< HEAD
    redirect_to projects_path, alert: 'You do not have permission to perform this action.' unless \
=======
    redirect_to projects_path, alert: 'You cannot perform this action.' unless \
>>>>>>> 078e52cb565b33078485fb74688b0b6e3a9da05d
    user.permission?("project.groups.#{permission}") ||
    user.permission?("#{project_id}.projects.groups.#{permission}")
  end

  def project_group_params
<<<<<<< HEAD
    params.require(:project).permit(:name, :description)
=======
    params.require(:project_group).permit(:name)
>>>>>>> 078e52cb565b33078485fb74688b0b6e3a9da05d
  end

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' unless @project
  end

<<<<<<< HEAD
  def set_project_groups
    @project_group = ProjectGroup.find_by(code: params[:code])
    redirect_to group_projects_path, alert: "Project Group not found" unless @projectGroup
=======
  def set_project_group
    @project_group = ProjectGroup.find_by(name: params[:name])
    redirect_to group_projects_path, alert: 'Group not found' unless @projectGroup
>>>>>>> 078e52cb565b33078485fb74688b0b6e3a9da05d
  end
end
