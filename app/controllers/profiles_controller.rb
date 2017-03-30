class ProfilesController < PermissionController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_permissions

  def index
    @profiles = User.all
  end

  def search
    string = params[:search_bar]
    @profiles = User.search(string) if string.present?
  end

  def show
    @can_edit = edit?(@user)
    @groups = @user.groups
    @roles = @user.project_roles
    @search_data = search_data
  end

  def edit; end

  # :reek:TooManyStatements { max_statements: 7 }
  def update
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to profile_path(@user) }
      else
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :location_id)
  end

  # set @can_edit true/false
  # is true if the user is trying to edit himself AND he has 'profile.edit'
  # permission, OR if the user has the 'profile.edit.others' permission.
  def edit?(user)
    current = current_user
    (user == current && current.permission?('profile.edit')) ||  \
      current.permission?('profile.edit.others')
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to authenticated_root_path, alert: 'User not found.' unless @user
  end

  def search_data
    data = {}
    (Skill.all - @user.skills).each { |s| data[s.name] = nil }
    data.to_json
  end
end
