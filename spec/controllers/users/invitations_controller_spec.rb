require 'rails_helper'

# rubocop:disable Rails/HttpPositionalArguments

RSpec.describe Users::InvitationsController, type: :controller do
  let(:group) { FactoryGirl.create(:group) }

  let(:root) { FactoryGirl.create(:root_user) }
  let(:no_permission) { FactoryGirl.create(:user, groups: [group]) }

  let(:users_invite) { FactoryGirl.create(:permission, name: 'users.invite') }

  let(:group_invite) do
    FactoryGirl.create(:permission, name: "users.invite.#{group.id}")
  end

  before do
    # Temporarly disable this cop, we need to set an instance variable
    # rubocop:disable RSpec/InstanceVariable
    @request.env['devise.mapping'] = Devise.mappings[:user]
    # rubocop:enable RSpec/InstanceVariable
  end

  describe '#create' do
    context 'unauthenticated user' do
      it 'throws 404' do
        expect { post :create }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'user with permission' do
      # A user without a group is invalid.
      it 'does not invite invalid user' do
        sign_in root
        expect { post :create, user: { email: 't@t.t' } }
          .to change { User.count }.by(0)
      end

      it 'invites new user' do
        sign_in root
        expect { post :create, user: { email: 't@t.t', groups: [group.id] } }
          .to change { User.count }.by(1)
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
        expect { post :create, user: { email: 't@t.t', groups: [group.id] } }
          .to change { User.count }.by(0)
      end
    end

    context 'user with users.invite.group_name permission' do
      it 'invites valid user' do
        sign_in no_permission

        group.permissions << [users_invite, group_invite]
        expect { post :create, user: { email: 't@t.t', groups: [group.id] } }
          .to change { User.count }.by(1)
      end
    end
  end

  describe '#new' do
    context 'unauthenticated user' do
      it 'throws 404' do
        expect { get :new }.to raise_error(ActionController::RoutingError)
      end
    end

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
# rubocop:enable Rails/HttpPositionalArguments
