class InvitationsController < PermissionController
  before_action :check_format, except: [:accept, :create_user, :index]
  before_action :check_permissions
  before_action :set_invitation, only: [:update, :destroy]
  skip_before_action :authenticate_user!, only: [:accept, :create_user]
  before_action :unauthenticated_only, only: [:accept, :create_user]
  before_action :verify_token, only: [:accept, :create_user]

  def index
    @invitations = Invitation.all
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invite_params)
    @invitation.inviter = current_user
    @invitation.invite
  end

  def update
    @invitation.update(invite_params)
    @invitation.reload
  end

  def destroy
    @invitation.destroy if can_delete?(@invitation)
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

  private

  def invite_params
    permitted_params = params.require(:invitation).permit(:email, groups: [])
    permitted_params[:groups] = Group.where(id: permitted_params[:groups])
    permitted_params
  end

  def set_invitation
    @invitation = Invitation.find_by(id: params[:id])
    head(404) unless @invitation
  end

  def check_format
    not_found unless request.xhr?
  end

  def can_delete?(invitation)
    user = current_user
    user == invitation.inviter || user.permission?('users.invite.delete')
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
end
