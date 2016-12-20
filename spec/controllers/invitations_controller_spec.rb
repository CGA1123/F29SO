require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  let(:group) { FactoryGirl.create(:group) }

  let(:root) { FactoryGirl.create(:root_user) }
  let(:no_permission) { FactoryGirl.create(:user, groups: [group]) }

  let(:users_invite) { FactoryGirl.create(:permission, name: 'users.invite') }

  let(:group_invite) do
    FactoryGirl.create(:permission, name: "users.invite.#{group.id}")
  end

  let(:valid_params) { { invitation: { email: 't@t.t', groups: [group.id] } } }

  let(:tokens) { Devise.token_generator.generate(Invitation, :token) }
  let(:raw_token) { tokens[0] }
  let(:stored_token) { tokens[1] }

  let(:invitation) { FactoryGirl.create(:invitation, token: stored_token) }

  describe '#create' do
    context 'user with users.invite permission' do
      before { sign_in root }
      # A user without a group is invalid.
      context 'parameters invalid' do
        it 'does not invite user' do
          expect { post :create, invitation: { email: 't@t.t' } }
            .to change { Invitation.count }.by(0)
        end

        it 'does not send an email' do
          expect { post :create, invitation: { email: 't@t.t' } }
            .to change { ActionMailer::Base.deliveries.count }.by(0)
        end
      end

      context 'parameters valid' do
        it 'invites new user' do
          expect { post :create, valid_params }
            .to change { Invitation.count }.by(1)
        end

        it 'sends an email' do
          expect { post :create, valid_params }
            .to change { ActionMailer::Base.deliveries.count }.by(1)
        end
      end
    end

    context 'user without users.invite permission' do
      it 'throws 404' do
        sign_in no_permission
        expect { post :create }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'user without users.invite.group_name permission' do
      it 'does not invite valid user' do
        sign_in no_permission

        group.permissions << [users_invite]
        expect { post :create, valid_params }
          .to change { Invitation.count }.by(0)
      end
    end

    context 'user with users.invite.group_name permission' do
      it 'invites valid user' do
        sign_in no_permission

        group.permissions << [users_invite, group_invite]
        expect { post :create, valid_params }
          .to change { Invitation.count }.by(1)
      end
    end
  end

  describe '#new' do
    context 'user with permission' do
      it do
        sign_in root
        get :new
        expect(response).to be_success
      end
    end

    context 'user without permission' do
      it 'throws 404' do
        sign_in no_permission
        expect { get :new }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe '#accept' do
    context 'user is logged in' do
      it do
        sign_in root
        get :accept
        expect(response).to redirect_to(authenticated_root_path)
      end
    end
    context 'with no token parameter' do
      # get :accept
      # expect(response).to redirect_to(unauthenticated_root)
    end

    context 'with valid token' do
    end

    context 'with invalid token' do
    end
  end
end
