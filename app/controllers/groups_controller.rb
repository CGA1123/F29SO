class GroupsController < PermissionController
  before_action :check_format
  before_action :check_permissions
  before_action :set_group, only: [:show, :destroy]

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def destroy
    @group.destroy unless @group.users.any?
  end

  def show; end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find_by(name: params[:name])
    head(404) unless @group
  end

  def check_format
    not_found unless request.xhr?
  end
end
