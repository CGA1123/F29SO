class AnnouncementController < PermissionController
  before_action :check_permissions

  def index
    @announcements = Announcement.all
  end
end
