class ProfilesController < PermissionController
  before_action :check_format, only: [:disable]
  before_action :set_user, only: [:show, :edit, :update, :disable]
  before_action :set_can_edit_profile, only: [:show, :edit, :update]
  before_action :set_can_edit_skills, only: [:show]
  before_action :check_permissions

  def index
    @profiles = User.all
  end

  def search
    string = params[:search_bar]
    @profiles = User.search(string) if string.present?
  end

  def show
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

  def disable
    return head(200) if @user == current_user
    @user.active = !@user.active
    @user.save ? head(200) : head(422)
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :location_id)
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

  def check_format
    head 404 unless request.xhr?
  end

  def set_can_edit_profile
    if (@user == current_user) && current_user.permission?('profile.edit')
      @can_edit_profile = true
    else
      @can_edit_profile = current_user.permission?('profile.edit.others')
    end
  end

  def set_can_edit_skills
    if (@user == current_user) &&
       current_user.permission?('profile.skills.manage')
      @can_edit_skill = true
    else
      @can_edit_skill = current_user.permission?('profile.skills.manage.others')
    end
  end
end
