require 'rails_helper'

RSpec.describe Users::InvitationsController, type: :controller do
  let(:root) { FactoryGirl.create(:root_user) }
  let(:no_permission) { FactoryGirl.create(:user) }

  before do
    # TODO: Don't use @request / Make exception for rubocop
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#create' do
    context 'unauthenticated user' do
      it 'throws 404' do
        expect { post :create }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'user with permission' do
      # rubocop:disable Rails/HttpPositionalArguments

      # A user without a group is invalid.
      it 'does not invite invalid user' do
        sign_in root
        expect { post :create, user: { email: 't@t.t' } }
          .to change { User.count }.by(0)
      end

      it 'invites new user' do
        sign_in root
        group = FactoryGirl.create(:group)
        expect { post :create, user: { email: 't@t.t', groups: [group.id] } }
          .to change { User.count }.by(1)
      end
      # rubocop:enable Rails/HttpPositionalArguments
    end

    context 'user without permission' do
      it 'throws 404' do
        sign_in no_permission
        expect { post :create }.to raise_error(ActionController::RoutingError)
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
