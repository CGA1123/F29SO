class AnnouncementsController < PermissionController
  before_action :check_permissions, only: [:create_project_announcement,
                                           :create_system_announcement,
                                           :destroy_project_annoucement,
                                           :destroy_system_announcement]

  def index
    @project_announcements = ProjectAnnouncement.where(project: Projects.where(user: current_user)).last(5)
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

  def project_announcement_params
    params.require(:project_announcement).permit(:title, :content, :project)
  end

  def system_announcement_params
    params.require(:system_announcement).permit(:title, :content)
  end
end
