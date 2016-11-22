module Users
  class InvitationsController < Devise::InvitationsController
    def new
      super
    end

    def create
      # TODO, need to check that on create, that the inviter actually has
      # permission to invite to a user into that group. This would involve a
      # dynamic permission, with a form of users.invite.<group_name>
      # We should probably also add a check so that no user can be invited as
      # root ?
      super
    end

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
  end
end
