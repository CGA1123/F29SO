class ProjectGroupUsersController < ApplicationController

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
    render 'project_group_users/search'
  end

end
