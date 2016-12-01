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
      context 'with no permission' do
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

      context 'with profile.edit permission' do
        before do
          user.groups << edit_group
          sign_in user
          get :show, id: user.id
        end

        it 'assigns @can_edit on own profile correctly' do
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'with profile.edit.others permission' do
        before do
          user.groups << edit_others_group
          sign_in user
          get :show, id: user.id
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

    describe 'GET #edit' do
      context 'with no permission' do
        before do
          sign_in user
          get :edit, id: user.id
        end

        context 'trying to edit his own profile' do
          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: user.id))
          end

          it 'displays an alert' do
            expect(flash[:alert]).to eq('Nope...')
          end
        end

        context 'trying to edit anothers profile' do
          it 'redirects to #show' do
            get :edit, id: another_user.id
            expect(response).to redirect_to(profile_path(id: another_user.id))
          end

          it 'displays an alert' do
            get :edit, id: another_user.id
            expect(flash[:alert]).to eq('Nope...')
          end
        end
      end

      context 'with profile.edit permission' do
        before do
          user.groups << edit_group
          sign_in user
          get :edit, id: user.id
        end
        context 'trying to edit his own profile' do
          it 'renders the edit form' do
            expect(response).to be_success
          end
        end

        context 'trying to edit anothers profile' do
          it 'redirects to #show' do
            get :edit, id: another_user.id
            expect(response).to redirect_to(profile_path(id: another_user.id))
          end

          it 'displays an alert' do
            get :edit, id: another_user.id
            expect(flash[:alert]).to eq('Nope...')
          end
        end
      end

      context 'with profile.edit.others permission' do
        before do
          user.groups << edit_others_group
          sign_in user
          get :edit, id: user.id
        end

        context 'trying to edit his own profile' do
          it 'renders the edit form' do
            expect(response).to be_success
          end
        end

        context 'trying to edit anothers profile' do
          it 'renders the edit form' do
            get :edit, id: another_user.id
            expect(response).to be_success
          end
        end
      end
    end

    describe 'PATCH #update' do
      context 'with no permission' do
        before do
          sign_in user
          patch :update, id: user.id, user: { location: 'Earth' }
        end

        context 'trying to edit his own profile' do
          it 'does not update the profile' do
            expect(user.reload.location).not_to eq('Earth')
          end

          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: user.id))
          end

          it 'displays an alert' do
            expect(flash[:alert]).to eq('Nope...')
          end
        end

        context 'trying to edit anothers profile' do
          it 'does not update the profile' do
            patch :update, id: another_user.id, user: { location: 'Earth' }
            expect(another_user.reload.location).not_to eq('Earth')
          end

          it 'redirects to #show' do
            patch :update, id: another_user.id, user: { location: 'Earth' }
            expect(response).to redirect_to(profile_path(id: another_user.id))
          end

          it 'displays an alert' do
            patch :update, id: another_user.id
            expect(flash[:alert]).to eq('Nope...')
          end
        end
      end

      context 'with profile.edit permission' do
        before do
          user.groups << edit_group
          sign_in user
          patch :update, id: user.id, user: { location: 'Earth' }
        end

        context 'trying to edit his own profile' do
          it 'updates the profile' do
            expect(user.reload.location).to eq('Earth')
          end

          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: user.id))
          end

          it 'does not display an alert' do
            expect(flash[:alert]).to be_nil
          end
        end

        context 'trying to edit anothers profile' do
          it 'does not update the profile' do
            patch :update, id: another_user.id, user: { location: 'Earth' }
            expect(another_user.reload.location).not_to eq('Earth')
          end

          it 'redirects to #show' do
            patch :update, id: another_user.id
            expect(response).to redirect_to(profile_path(id: another_user.id))
          end

          it 'displays an alert' do
            patch :update, id: another_user.id
            expect(flash[:alert]).to eq('Nope...')
          end
        end
      end

      context 'with profile.edit.others permission' do
        before do
          user.groups << edit_others_group
          sign_in user
          patch :update, id: user.id, user: { location: 'Earth' }
        end

        context 'trying to edit his own profile' do
          it 'updates the profile' do
            expect(user.reload.location).to eq('Earth')
          end

          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: user.id))
          end

          it 'does not display an alert' do
            expect(flash[:alert]).to be_nil
          end
        end

        context 'trying to edit anothers profile' do
          it 'updates the profile' do
            patch :update, id: another_user.id, user: { location: 'Earth' }
            expect(another_user.reload.location).to eq('Earth')
          end

          it 'redirects to #show' do
            patch :update, id: another_user.id, user: { location: 'Earth' }
            expect(response).to redirect_to(profile_path(id: another_user.id))
          end

          it 'does not displays an alert' do
            patch :update, id: another_user.id, user: { location: 'Earth' }
            expect(flash[:alert]).to be_nil
          end
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
