class AnnouncementController < PermissionController
  before_action :check_permissions

  def index
    @announcements = Announcement.all
  end

  def create
    @announcement = Announcement.new(announcement_params)
    redirect_to announcements_path
  end

  def destroy
    @announcement = Announcement.find_by(id: params[:id])

    @announcement.destroy if
      @announcement.present? && user.permission('announcement.manage')
    redirect_to announcements_path, alert: 'Announcement Deleted.'
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end
end
