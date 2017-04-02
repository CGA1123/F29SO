class ProjectRoleUsersController < PermissionController
  before_action :check_format
  before_action :set_project
  before_action :set_project_role
  before_action :check_permissions
  before_action :set_project_role_user, only: [:destroy]
  before_action :set_user, only: [:create]

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
      users = User.all
    elsif params[:location].include?('role')
      users = User.where(location: @project_role.locations)
    else
      ids = params[:location].map(&:to_i)
      users = User.where(location_id: ids)
    end

    users &= @project.users if params[:project].present?
    users &= @project_role.users if params[:role].present?
    users = users.search(name) unless name.blank?

    if params[:skills].present?
      skills = @project_role.skills

      # get list of users that possess each skill
      user_ranking = {}
      users.each do |user|
        # if no skills have been specified in the project role,
        # rank users based on all the skills they have, else rank them on
        # the relevant skills
        skills = skills.present? ? skills : user.skills
        intersection = UserSkill.where(user: user, skill: skills)

        # magically rank them
        user_ranking[user.id] = rank(intersection) unless intersection.empty?
      end

      # sort by rank (magic also)
      ranks = user_ranking.keys.sort_by { |id| -user_ranking[id] }
      users = []
      ranks.each do |id|
        users << User.find(id)
      end
    end
    @ranks = user_ranking
    @users = users
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  private

  def set_project
    @project = Project.find_by(code: params[:code])
    redirect_to projects_path, alert: 'Project not found' \
      unless @project
  end

  def set_project_role
    @project_role = ProjectRole.find_by(project: @project,
                                        name: params[:name])
    head(404) unless @project_role
  end

  def set_project_role_user
    @project_role_user = ProjectRoleUser.find_by(project_role: @project_role,
                                                 user_id: params[:id])
    head(404) unless @project_role_user
  end

  def rank(skills)
    rank = skills.count
    skills.each do |skill|
      # placeholder. Need to work out the best way to factor in skill rating
      rank += (skill[:rating] + 1)
    end
    rank
  end

  def set_user
    @user = User.find_by(id: params[:id])
    head(404) unless @user
  end

  def check_format
    not_found unless request.xhr?
  end
end
