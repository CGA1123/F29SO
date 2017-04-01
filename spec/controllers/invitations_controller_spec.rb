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

  let(:location) { FactoryGirl.create(:location) }

  let!(:invitation) { FactoryGirl.create(:invitation, token: stored_token) }

  describe 'POST #create' do
    context 'user with users.invite permission' do
      before { sign_in root }
      # A user without a group is invalid.
      context 'parameters invalid' do
        it 'does not invite user' do
          expect { xhr :post, :create, invitation: { email: 't@t.t' } }
            .to change { Invitation.count }.by(0)
        end

        it 'does not send an email' do
          expect { xhr :post, :create, invitation: { email: 't@t.t' } }
            .not_to have_enqueued_job.on_queue('mailers')
        end
      end

# rubocop:disable Style/BlockComments, Style/InlineComment
=begin
      context 'parameters valid' do
        it 'invites new user' do
          expect { xhr :post, :create, valid_params }
            .to change { Invitation.count }.by(1)
        end

        it 'sends an email' do
          expect { xhr :post, :create, valid_params }
            .to have_enqueued_job.on_queue('mailers')
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
=end
    end
  end
  # rubocop:enable Style/BlockComments, Style/InlineComment

  describe 'GET #accept' do
    context 'user is logged in' do
      it do
        sign_in root
        get :accept
        expect(response).to redirect_to(authenticated_root_path)
      end
    end

    context 'user is not logged in' do
      context 'with valid token' do
        before { invitation }

        it do
          get :accept, token: raw_token
          expect(response).to be_success
        end

        it 'build a @user' do
          get :accept, token: raw_token
          expect(assigns[:user]).not_to be_nil
        end
      end

      context 'with invalid/empty token' do
        it do
          get :accept, token: ''
          expect(response).to redirect_to(unauthenticated_root_path)
        end

        it 'sets a notice' do
          get :accept, token: ''
          expect(flash[:notice]).to eq('Your invitation token is invalid')
        end
      end
    end
  end

  describe 'POST #create_user' do
    context 'user signed in' do
      it do
        sign_in root
        post :create_user
        expect(response).to redirect_to(unauthenticated_root_path)
      end
    end

    context 'user is not signed in' do
      context 'token is invalid/empty' do
        it do
          post :create_user, token: ''
          expect(response).to redirect_to(unauthenticated_root_path)
        end

        it do
          post :create_user, token: ''
          expect(flash[:notice]).to eq('Your invitation token is invalid')
        end
      end

      context 'token is valid' do
        before { invitation }
        context 'params are valid' do
          let(:user_params) do
            {
              token: raw_token,
              user: { first_name: 'f',
                      last_name: 'l',
                      location_id: location.id,
                      password: 'password',
                      password_confirmation: 'password' }
            }
          end

          it do
            post :create_user, user_params
            expect(response).to redirect_to(unauthenticated_root_path)
          end

          it 'creates a user' do
            expect { post :create_user, user_params }
              .to change { User.count }.by(1)
          end
        end

        context 'params invalid' do
          it 're renders #accept' do
            post :create_user, token: raw_token, user: { first_name: 'f' }
            expect(response).to render_template(:accept)
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user w/o users.invite permission' do
      it do
        sign_in no_permission
        expect { xhr :delete, :destroy, id: 'breh' }
          .to raise_error(ActionController::RoutingError)
      end
    end

    context 'user w/ users.invite permission' do
      let(:in_group) { FactoryGirl.create(:group, permissions: [users_invite]) }
      let(:user) { FactoryGirl.create(:user, groups: [in_group]) }

      #      context 'w/ only users.invite permission' do
      #        before do
      #          sign_in user
      #          xhr :delete, :destroy, id: invitation.id
      #        end
      #      end

      context 'w/ users.invite.delete' do
        let(:invite_delete) do
          FactoryGirl.create(:permission, name: 'users.invite.delete')
        end

        before do
          in_group.permissions << invite_delete
          sign_in user
        end

        it do
          xhr :delete, :destroy, id: invitation.id
        end

        it 'sets @invitation' do
          xhr :delete, :destroy, id: invitation.id
          expect(assigns[:invitation]).to eq(invitation)
        end

        it 'removes invitation' do
          expect { xhr :delete, :destroy, id: invitation.id }
            .to change(Invitation, :count).by(-1)
        end
      end
    end
  end

  describe 'GET #index' do
    context 'no permissions' do
      it 'throws not found' do
        sign_in no_permission
        expect { get :index }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'with permissions' do
      before do
        sign_in root
        get :index
      end

      it { expect(response).to be_success }

      it 'assigns @invitations' do
        expect(assigns[:invitations]).to eq(Invitation.all)
      end
    end
  end
end
