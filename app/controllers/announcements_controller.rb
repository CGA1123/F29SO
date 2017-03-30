class AnnouncementsController < PermissionController
  before_action :set_project, only: [:create_project_announcement,
                                     :destroy_project_announcement,
                                     :show_project]
  before_action :check_permissions, except: [:index]
  before_action :set_project_announcement, only: [:destroy_project_announcement,
                                                  :show_project]
  before_action :set_system_announcement, only: [:destroy_system_announcement]
  before_action :set_can_manage, only: [:index, :show_project, :show_system]

  def index
    @projects = current_user.projects
    @project_announcements = ProjectAnnouncement
                             .where(project: @projects).last(10).reverse
    @system_announcements =
      SystemAnnouncement.where('created_at > ?', 30.days.ago).last(3).reverse
    @announcement = SystemAnnouncement.new
  end

  def show_project
    @announcements = @project.project_announcements.order 'created_at DESC'
    @announcement = ProjectAnnouncement.new
    @selected_id = params[:id] ? params[:id] : @announcements.first.id.to_s \
      unless @announcements.empty?
  end

  def show_system
    @announcement = SystemAnnouncement.find_by(id: params[:id])
  end

  def create_project_announcement
    @announcement = ProjectAnnouncement.new(project_announcement_params)
    @announcement.project = @project
    @announcement.save
    redirect_to project_announcements_path(id: @announcement.id)
  end

  def create_system_announcement
    @announcement = SystemAnnouncement.new(system_announcement_params)
    @announcement.save
    redirect_to announcements_path
  end

  def destroy_project_announcement
    @announcement.destroy
    redirect_to project_announcements_path, alert: 'Announcement Deleted.'
  end

  def destroy_system_announcement
    @announcement.destroy
    redirect_to announcements_path, alert: 'Announcement Deleted.'
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    head 404 unless @project
  end

  def project_announcement_params
    params.require(:project_announcement).permit(:title, :content)
  end

  def system_announcement_params
    params.require(:system_announcement).permit(:title, :content)
  end

  def set_project_announcement
    @announcement = ProjectAnnouncement.find_by(id: params[:id],
                                                project: @project)
  end

  def set_system_announcement
    @announcement = SystemAnnouncement.find_by(id: params[:id])
    not_found unless @announcement
  end

  def set_can_manage
    if @project
      @can_manage = current_user.permission?(
        'announcements.manage',
        "#{@project.id}.announcements.manage"
      )
    else
      @can_manage = current_user.permission?('announcements.manage')
    end
  end
end
