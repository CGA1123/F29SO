class InvitationsController < PermissionController
  before_action :authenticate_inviter, only: [:create, :new, :index, :destroy]
  before_action :check_permissions, only: [:create]

  skip_before_action :authenticate_user!, only: [:accept, :create_user]
  before_action :unauthenticated_only, only: [:accept, :create_user]
  before_action :verify_token, only: [:accept, :create_user]

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invite_params)
    @invitation.inviter = current_user

    if @invitation.invite
      redirect_to invitations_path
    else
      render :new
    end
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
    params = {}

    if @invitation.present? && can_delete?(@invitation)
      @invitation.destroy
      params[:notice] = 'Invitation deleted.'
    else
      params[:alert] = 'Could not delete invitation.'
    end

    redirect_to invitations_path, params
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

  # Need to ensure that the inviting user has the right permissions
  def check_permissions
    groups = invite_params[:groups]
    groups.each do |group|
      message = "You don't have permission to invite #{group.name}"
      redirect_to new_invitation_path, alert: message \
        unless current_user.permission?("users.invite.#{group.id}")
    end
  end

  # If a user is not logged in, or does not have appropriate permission to
  # invite a user, throw a 404.
  # This method is called before the actions: new, create
  # not_found is defined in ApplicationController
  def authenticate_inviter
    not_found unless user_signed_in? && current_user.permission?('users.invite')
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
end
