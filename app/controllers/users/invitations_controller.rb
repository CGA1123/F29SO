module Users
  class InvitationsController < Devise::InvitationsController
    before_action :check_permissions, only: [:create]

    private

    # Override the `invite_params` method
    # invite_params returns the parameters used to create the new invited user.
    def invite_params
      permitted_params = devise_parameter_sanitizer.sanitize(:invite)

      # The params hash sent through the HTTP POST request contains an array of
      # integers, relating to the ID of the groups, this method maps those IDs
      # to the actual Group object. (This is necessary for the relationship
      # between Group & User to work)
      permitted_params[:groups] = Group.where(id: permitted_params[:groups])

      permitted_params
    end

    # Need to ensure that the inviting user has the right permissions
    def check_permissions
      groups = invite_params[:groups]
      groups.each do |group|
        message = "You don't have permission to invite #{group.name}"
        redirect_to new_user_invitation_path, alert: message \
          unless current_user.permission?("users.invite.#{group.id}")
      end
    end
  end
end
