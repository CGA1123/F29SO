class ProjectRoleUsersController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :set_project_role
  before_action :check_permissions
  before_action :set_project_role_user, only: [:destroy]
  before_action :set_user, only: [:create]

  def index
    @project_role_users = ProjectRoleUser.where(project_role: @project_role)
  end

  def create
    @project_role_user =
      ProjectRoleUser.new(user: @user, project_role: @project_role)
    @project_role_user.save
  end

  def destroy
    @project_role_user.destroy
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def search
    name = params[:user]
    if !params[:location].present? || params[:location].include?('')
      locations = Location.all
    elsif params[:location].include?('role')
      locations = @project_role.locations
    else
      ids = params[:location].map(&:to_i)
      locations = @project_role.locations & Location.where(id: ids)
    end

    users = User.where(location: locations)
    users &= @project.users if params[:project].present?
    users &= @project_role.users if params[:role].present?
    users = users.search(name) unless name.blank?

    if params[:skills].present?
      skills = @project_role.skills
      users = UserSkill.where(user: users, skill: skills).map(&:user)
    end

    @users = users
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def match
    # get list of users that are at at least one of the locations
    skills = @project_role.skills

    users_with_locations = User.where(location: @project_role.locations)

    # get list of users that possess each skill
    user_ranking = {}
    users_with_locations.each do |user|
      # if no skills have been specified in the project role,
      # rank users based on all the skills they have, else rank them on
      # the relevant skills
      if skills.present?
        intersection = UserSkill.where(user: user, skill: user.skills & skills)
      else
        intersection = UserSkill.where(user: user, skill: user.skills)
      end

      # magically rank them
      user_ranking[user.id] = rank(intersection) unless intersection.empty?
    end

    # sort by rank (magic also)
    ranks = user_ranking.keys.sort_by { |id| -user_ranking[id] }
    @ranks = []
    ranks.each do |id|
      @ranks << User.find(id)
    end
  end

  def match
    # get list of users that are at at least one of the locations
    users_with_locations = User.where(location: @project_role.locations)

    # get list of users that possess each skill
    user_ranking = {}
    users_with_locations.each do |user|
      intersection = UserSkill.where(user: user,
                                     skill: @project_role.skills)
      # magically rank them
      user_ranking[user.id] = rank(intersection) unless intersection.empty?
    end

    # sort by rank (magic also)
    user_ranking.keys.sort_by { |id| -user_ranking[id] }
  end

  def match
    # get list of users that are at at least one of the locations
    locations = @project_role.locations
    skills = @project_role.skills
    users_with_locations = User.where(location: locations)

    # get list of users that possess each skill
    user_ranking = {}
    users_with_locations.each do |user|
      # if no skills have been specified in the project role,
      # rank users based on all the skills they have, else rank them on
      # the relevant skills
      if skills.present?
        intersection = UserSkill.where(user: user, skill: user.skills & skills)
      else
        intersection = UserSkill.where(user: user, skill: user.skills)
      end

      # magically rank them
      user_ranking[user.id] = rank(intersection) unless intersection.empty?
    end

    # sort by rank (magic also)
    ranks = user_ranking.keys.sort_by { |id| -user_ranking[id] }
    @ranks = []
    ranks.each do |id|
      @ranks << User.find(id)
    end
  end

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' \
      unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    return if @project_role
    flash[:alert] = 'Project role not found'
    redirect_to project_roles_path(code: @project.code)
  end

  def set_project_role_user
    @project_role_user = ProjectRoleUser.find_by(project_role: @project_role,
                                                 user_id: params[:id])
    return if @project_role_user
    flash[:alert] = 'Project group user not found'
    redirect_to project_role_users_path(code: @project.code,
                                        name: @project_role.name)
  end

  def rank(skills)
    rank = skills.count
    skills.each do |skill|
      # placeholder. Need to work out the best way to factor in skill rating
      rank += (skill[:rating] + 1) / 5
    end
    rank
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return if @user
    flash[:alert] = 'User not found'
    redirect_to project_path(code: @project.code)
  end

  def check_format
    not_found unless request.xhr?
  end
end
