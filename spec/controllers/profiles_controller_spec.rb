require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  let(:edit_perm) { FactoryGirl.create(:permission, name: 'profile.edit') }
  let(:edit_others_perm) do
    FactoryGirl.create(:permission, name: 'profile.edit.others')
  end

  let(:edit_group) { FactoryGirl.create(:group, permissions: [edit_perm]) }
  let(:edit_others_group) do
    FactoryGirl.create(:group, permissions: [edit_others_perm])
  end

  context 'User is signed in' do
    describe 'GET #show' do
      context 'a user with no permission' do
        before do
          sign_in user
          get :show, id: user.id
        end

        it { expect(response).to be_success }

        context 'assigns @user correctly' do
          it 'equals user' do
            expect(assigns['user']).to eq(user)
          end

          it 'equals another_user' do
            get :show, id: another_user.id
            expect(assigns['user']).to eq(another_user)
          end
        end

        it 'assigns @groups correctly' do
          expect(assigns['groups']).to eq(user.groups)
        end

        it 'assigns @can_edit on own profile correctly' do
          expect(assigns['can_edit']).to eq(false)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'a user with profile.edit permission' do
        before do
          user.groups << edit_group
          sign_in user
          get :show, id: user.id
        end

        it 'has the profile.edit permission' do
          expect(user.permission?('profile.edit')).to be_truthy
        end

        it 'assigns @can_edit on own profile correctly' do
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'a user with profile.edit.others permission' do
        before do
          user.groups << edit_others_group
          sign_in user
          get :show, id: user.id
        end

        it 'has the profile.edit.others permission' do
          expect(user.permission?('profile.edit.others')).to be_truthy
        end

        it 'assigns @can_edit on own profile correctly' do
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(true)
        end
      end
    end
  end

  context 'User is not signed in' do
    describe 'GET #show' do
      it do
        get :show, id: 'id_shouldnt_matter'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it do
        get :edit, id: 'id_shouldnt_matter'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #update' do
      it do
        patch :update, id: 'id_shouldnt_matter'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
