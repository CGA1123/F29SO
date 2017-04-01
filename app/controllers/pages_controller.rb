class PagesController < PermissionController
  def user_home
    @projects = current_user.projects
    @project_announcements = ProjectAnnouncement
                             .where(project: @projects).last(10).reverse
    @system_announcements =
      SystemAnnouncement.where('created_at > ?', 30.days.ago).last(3).reverse
    @announcement = SystemAnnouncement.new
  end
end
