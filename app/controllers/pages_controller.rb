class PagesController < PermissionController
  def user_home
    @projects = current_user.projects
  end
end
