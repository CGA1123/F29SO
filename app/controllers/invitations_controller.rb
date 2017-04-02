class InvitationsController < PermissionController
  before_action :check_permissions

  skip_before_action :authenticate_user!, only: [:accept, :create_user]
  before_action :unauthenticated_only, only: [:accept, :create_user]
  before_action :verify_token, only: [:accept, :create_user]
  before_action :set_can_manage, only: [:index]

  def index
    @invitations = Invitation.all
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invite_params)
    @invitation.inviter = current_user
    @invitation.invite
  end

  def accept
    @user = User.new
  end

  # :reek:TooManyStatements { max_statements: 8 }
  def create_user
    @user = User.new(accept_params)
    @user.email = @invitation.email
    @user.groups = @invitation.groups
    @user.skip_confirmation!
    if @user.save
      @invitation.destroy!
      redirect_to unauthenticated_root_path
    else
      render :accept
    end
  end

  def destroy
    @invitation = Invitation.find_by(id: params[:id])

    @invitation.destroy if @invitation.present? && can_delete?(@invitation)

    redirect_to invitations_path
  end

  private

  # invite_params returns the parameters used to create the new invited user.
  def invite_params
    permitted_params = params.require(:invitation).permit(:email, groups: [])

    # The params hash sent through the HTTP POST request contains an array of
    # integers, relating to the ID of the groups, this method maps those IDs
    # to the actual Group object. (This is necessary for the relationship
    # between Group & User to work)
    permitted_params[:groups] = Group.where(id: permitted_params[:groups])

    permitted_params
  end

  def accept_params
    params.require(:user)
          .permit(:password,
                  :password_confirmation,
                  :first_name,
                  :last_name,
                  :location_id)
  end

  def verify_token
    @token = params[:token]
    @invitation = Invitation.with_token(@token)
    # return now if an @invitation was found (nil == false)
    return if @invitation
    redirect_to unauthenticated_root_path,
                notice: 'Your invitation token is invalid'
  end

  def can_delete?(invitation)
    user = current_user
    user == invitation.inviter || user.permission?('users.invite.delete')
  end

  def set_can_manage
    @can_manage = current_user.permission?('users.invite')
  end
end
