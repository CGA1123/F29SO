class ProjectGroupUsersController < ApplicationController
<<<<<<< HEAD

  def search
    string = params[:user]
    @results = User.search(string) unless string.blank?
    render 'project_group_users/search'
  end

=======
>>>>>>> 5972c991d9116c0cea1d82395c66c150c9ae516a
end
