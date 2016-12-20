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
end
