class AnnouncementsController < PermissionController
  before_action :set_project, only: [:create_project_announcement]
  before_action :set_project_announcement, only: [:destroy_project_annoucement]
  before_action :check_permissions, except: [:index]

  def index
    @project_announcements = ProjectAnnouncement.where(project: current_user.projects).last(5)
    @system_announcements = SystemAnnouncement
                            .where('created_at > ?', 30.days.ago).last(5)
  end

  def create_project_announcement
    @announcement = ProjectAnnouncement.new(project_announcement_params)
    redirect_to announcements_path
  end

  def create_system_announcement
    @announcement = SystemAnnouncement.new(system_announcement_params)
    redirect_to announcements_path
  end

  def destroy_project_annoucement
    @announcement = ProjectAnnouncement.find_by(id: params[:id])

    @announcement.destroy if @announcement.present?
    redirect_to announcements_path, alert: 'Announcement Deleted.'
  end

  def destroy_system_announcement
    @announcement = SystemAnnouncement.find_by(id: params[:id])

    @announcement.destroy if @announcement.present?
    redirect_to announcements_path, alert: 'Announcement Deleted.'
  end

  private

  def set_project
    @project = Project.find_by(params[:project_id])
    not_found unless @project
  end

  def project_announcement_params
    params.require(:project_announcement).permit(:title, :content, :project)
  end

  def system_announcement_params
    params.require(:system_announcement).permit(:title, :content)
  end

  def set_project_announcement
    @project_announcement = ProjectAnnouncement.find_by(id: params[:id])
    not_found unless @project_announcement
    @project = @project_announcement.project
  end
end
